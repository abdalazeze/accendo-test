<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Homeworks extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    
    public function toArray($request)
    {
        //var_dump($request);
            return [
            'id' => $this->id,
            'name' => $this->name,
            'description' => $this->description,
            'submited' => $this->submited,
            'created_at' => $this->created_at? $this->created_at->format('d/m/Y'):"",
            'updated_at' =>  $this->updated_at? $this->updated_at->format('d/m/Y'):"",
        ];
    
        
    }
}
