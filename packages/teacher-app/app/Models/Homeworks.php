<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Homeworks extends Model
{
    use HasFactory;
     /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'description',
        'submited',
        
    ];
    public function teachers()
    {
        return $this->belongsToMany(User::class);
    }
    public function students()
    {
        return $this->belongsToMany(User::class);
    }
    
    public function createManyRecord(array $records){
        foreach ($records as $record) {
            $this->create($record);
        }
        return $this;
    }
}
