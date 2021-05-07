<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GuzzleHttp\Client;
use App\Http\Controllers\BaseController as BaseController;
use Illuminate\Support\Facades\Http;
class RegisterController extends BaseController
{
    /**
     * Register api
     *
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        $client = new \GuzzleHttp\Client();
        $url = env('TEACHER_API')."register";
        $input = $request->all();    
        $response = $client->post($url, [
           \GuzzleHttp\RequestOptions::JSON =>  [
                'name'     => $input['name'],
                'username'     => $input['username'],
                'email'     =>  $input['email'],
                'password'     =>  $input['password'],
                'c_password'     =>  $input['c_password'],
                'role'     =>  $input['role'],
            ] 
        ]);
        
        $contents = $response->getBody()->getContents();
        return $this->sendResponse($contents);
    
    }
   
    /**
     * Login api
     *
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        $client = new \GuzzleHttp\Client();
        $url = env('TEACHER_API')."loginStudent";
        $input = $request->all();    
        $response = $client->post($url, [
           \GuzzleHttp\RequestOptions::JSON =>  [
                'email'     =>  $input['email'],
                'password'     =>  $input['password'],
              
            ] 
        ]);
        
        $contents = $response->getBody()->getContents();
        return $this->sendResponse($contents);
    }
    

}