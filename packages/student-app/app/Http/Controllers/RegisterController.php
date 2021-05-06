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
        $url = "http://127.0.0.1:8080/api/register";
        $input = $request->all();    
        $response = $client->post($url, [
           \GuzzleHttp\RequestOptions::JSON =>  [
                'name'     => $input['name'],
                'username'     => $input['username'],
                'email'     =>  $input['email'],
                'password'     =>  $input['password'],
                'c_password'     =>  $input['c_password'],
                'role'     =>  $input['role'],
            ] // or 'json' => [...]
        ]);
        
        $contents = $response->getBody()->getContents();
        return $this->sendResponse($contents);
    
        //dd($$);
    }
   
    /**
     * Login api
     *
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        $client = new \GuzzleHttp\Client();
        $url = "http://127.0.0.1:8080/api/loginStudent";
        $input = $request->all();    
        $response = $client->post($url, [
           \GuzzleHttp\RequestOptions::JSON =>  [
                'email'     =>  $input['email'],
                'password'     =>  $input['password'],
              
            ] // or 'json' => [...]
        ]);
        
        $contents = $response->getBody()->getContents();
        return $this->sendResponse($contents);
    }
    

}