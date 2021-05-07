<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use App\Models\Role;
use App\Models\User;
class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $role_teacher = Role::where('name', 'teacher')->first();
        $role_student  = Role::where('name', 'student')->first();
        for($i=0; $i<5; $i++){
            $teacher = new User();
            $teacher->name = 'teacher Name'.$i;
            $teacher->username = 'teacher UserName'.$i;
            $teacher->email = 'teacher'.$i.'@example.com';
            $teacher->password = Hash::make('password');
            $teacher->save();
            $teacher->roles()->attach($role_teacher);
        }
        for($j=0; $j<20; $j++){
            $student = new User();
            $student->name = 'student Name'.$j;
            $student->username = 'student UserName'.$i;
            $student->email = 'student'.$j.'@example.com';
            $student->password = Hash::make('password'.$j);
            $student->save();
            $student->roles()->attach($role_student);
        }
        
    }
}