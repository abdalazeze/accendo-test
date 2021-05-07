<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\BaseController as BaseController;

class HomeWorkController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(\Illuminate\Http\Request $request)
    {     
        // Use this to send to teacher app api to get results   
        $client = new \GuzzleHttp\Client();
        $url = env('TEACHER_API')."homeworksUser";
        //Get api token
        $header = $request->header('Authorization'); 
        
        $response = $client->get($url, [
            'headers'        => ['Accept' => 'application/json','Authorization'=>$header],
        ]);
        
        $contents = $response->getBody()->getContents();
        return $this->sendResponse($contents);

    }

    /**
     * submitHomeWork of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function submitHomeWork(\Illuminate\Http\Request $request, $id)
    {     
        // Use this to send to teacher app api to submitHomeWork 
        $client = new \GuzzleHttp\Client();
        $url = env('TEACHER_API')."homeworks/".$id;
        
        //Get api token
        $header = $request->header('Authorization'); 
        
        try {
            $response = $client->put($url, [
                'headers'        => ['Accept' => 'application/json','Authorization'=>$header],
            ]);
            
            $contents = $response->getBody()->getContents();
         
            return $this->sendResponse($contents);
         } catch (\Exception $ex) {
           $response = $ex->getResponse();
           \Log::critical($ex);
          
           return $this->sendError((string)$response->getBody());
         }
    }
}
