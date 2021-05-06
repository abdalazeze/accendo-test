<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\BaseController as BaseController;
use App\Models\User;
use App\Models\Role;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Validator;
class RegisterController extends BaseController
{
    /**
     * Register api
     *
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'username' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'role' => 'required',
            'c_password' => 'required|same:password',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }
   
        $input = $request->all();        
        $input['password'] = Hash::make($input['password']);
        $user = User::create($input);
        $role = DB::table('roles')->where('name', $input['role'])->first();
        $user->roles()->attach($role->id);
        $success['token'] =  $user->createToken('MyApp')->accessToken;
        $success['name'] =  $user->name;
   
        return $this->sendResponse($success, 'User register successfully.');
    }
   
    /**
     * Login api
     *
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){ 
            $user = Auth::user();
            if(!Auth::user()->hasRole('teacher')){
               
                return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
            } 
                
            /* foreach ($user->roles as $role) {
                if (!isset($role->name) && $role->name !== "teacher") 
                return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
            }  */
            
            $success['token'] =  $user->createToken('MyTeacherApp')-> accessToken; 
            $success['name'] =  $user->name;
   
            return $this->sendResponse($success, 'User login successfully.');
        } 
        else{ 
            return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
        } 
    }
    /**
     * Login api
     *
     * @return \Illuminate\Http\Response
     */
    public function loginStudent(Request $request)
    {
        if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){ 
            $user = Auth::user(); 
            if(!Auth::user()->hasRole('student')) 
                return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
            /* foreach ($user->roles as $role){ 
            if (!isset($role->name) && $role->name !== "student") 
                return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
            } */
            $success['token'] =  $user->createToken('MyStudentApp')-> accessToken; 
            $success['name'] =  $user->name;
   
            return $this->sendResponse($success, 'User login successfully.');
        } 
        else{ 
            return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
        } 
    }

}
