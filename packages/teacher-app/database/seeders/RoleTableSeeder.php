<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Role;
class RoleTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $role_employee = new Role();
        $role_employee->name = 'teacher';
        $role_employee->description = 'A teacher user';
        $role_employee->save();
        $role_manager = new Role();
        $role_manager->name = 'student';
        $role_manager->description = 'A student user';
        $role_manager->save();
    }
}
