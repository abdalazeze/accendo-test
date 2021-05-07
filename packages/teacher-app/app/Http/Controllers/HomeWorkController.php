<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\BaseController as BaseController;
use App\Models\Homeworks;
use App\Models\User;
use Illuminate\Support\Facades\Auth;use Illuminate\Support\Facades\DB;
use Validator;
/* use Illuminate\Support\Facades\Notification; */
use Notification;
use App\Notifications\AlertNotification;
use App\Http\Resources\Homeworks as HomeworkResource;
class HomeWorkController extends BaseController
{
   
   /**
    *  Get student homework
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $student = Auth::user();
        
        $homeWorks = Homeworks::whereIn('student_id', [$student->id])->get();
    
        return $this->sendResponse(HomeworkResource::collection($homeWorks), 'Homeworks retrieved successfully.');
    }

     /**
     * Display a listing of the Students Users.
     *
     * @return \Illuminate\Http\Response
     */
    public function getStudentsUsers()
    {
        //check user is it teacher or not
        if(!Auth::user()->hasRole('teacher'))
            return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
        
        $students = User::whereHas(
            'roles', function($q){
                $q->where('name', 'student');
            }
        )->get();
    
        return $this->sendResponse(HomeworkResource::collection($students), 'Students retrieved successfully.');
    }
    /**
     * Display a listing of the Submited HomeWorks.
     *
     * @return \Illuminate\Http\Response
     */
    public function getHomeWorksSubmited()
    {
        //check user is it teacher or not
        if(!Auth::user()->hasRole('teacher'))
            return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
        
        $teacher = Auth::user();

        //get homeworks for this teacher and should be submited from students
        $submitedHomeWorks = Homeworks::where(['teacher_id'=>$teacher->id,'submited'=>1])->get();
    
        return $this->sendResponse(HomeworkResource::collection($submitedHomeWorks), 'Submited HomeWorks retrieved successfully.');
    }
    
     /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //check user is it teacher or not
        if(!Auth::user()->hasRole('teacher'))
            return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);

        //get whice user login
        $teacher = Auth::user();

        $input = $request->all();

        //put teacher id whice is teacher
        $input['teacher_id'] = $teacher->id;

        $validator = Validator::make($input, [
            'name' => 'required',
            'description' => 'required',
            'student_id' => 'required',
            'teacher_id' => 'required'
        ]);
        
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }
        $date = date("Y-m-d H:i:s"); 
        
        foreach ($input['student_id'] as $student){
       
            $newHomework['name']=$input['name'];
            $newHomework['description']=$input['description'];
            $newHomework['teacher_id']=$input['teacher_id'];
            $newHomework['student_id']=$student;
            $newHomework['created_at']=$date;
            $newHomework['updated_at']=$date;
            $newHomeworks[]= $newHomework;
        }
        
        $homework = Homeworks::insert($newHomeworks);
    
        return $this->sendResponse($homework, 'Homework created successfully.');
        
    } 
    /**
     * Submit homewrok by student
     *
     *@param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function submitHomeWork(Request  $request, $id)
    {
        //check user is it student or not
        if(!Auth::user()->hasRole('student'))
            return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
            
        $homeWork = Homeworks::find($id);

        if (is_null($homeWork)) {
            return $this->sendError('Homework not found.');
        }
        if ($homeWork->submited){
            return $this->sendError('Homework Already submited.');
        }
        $teacher = User::find($homeWork->teacher_id);
        $student = User::find($homeWork->student_id);
        /* $details = [
            'name' => 'Hi '. $teacher->name,
            'body' => 'This is to update you student'.$student->name.'submited homework',
            'thanks' => 'Thank you!',
            'text' => 'Homework submited',
            'url' => url('/{$homeWork->id}'),
            'homework_id' => $homeWork->id
        ];
        Notification::send($teacher,new AlertNotification($details)); */
        $homeWork->submited = true;
        $homeWork->save();
   
        return $this->sendResponse(new HomeworkResource($homeWork), 'Homework submited successfully.');
    }
}