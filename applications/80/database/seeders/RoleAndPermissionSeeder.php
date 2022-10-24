<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\User;

class RoleAndPermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $superadminPermission = Permission::create(['name' => '@@superadmin@@']);
        $superadminRole = Role::create(['name' => 'superadmin']);
        $superadminRoleId = $superadminRole->id;

        $superadminRole->givePermissionTo($superadminPermission);

        Role::create(['name' => 'admin']);
        Role::create(['name' => 'manager']);
        Role::create(['name' => 'user']);
        
        setPermissionsTeamId($superadminRoleId);

        $superAdminUser = User::where('email', 'admin@localhost')->first();
        $superAdminUser->assignRole($superadminRole);
    }
}