<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use Illuminate\Database\Seeder;
use App\Models\Team;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $user = new User();
        $user->name = 'SUPERADMINISTRATOR';
        $user->email = 'admin@localhost';
        $user->password = Hash::make('password');
        $user->email_verified_at = Carbon::now();
        $user->save();

        $superAdmin = User::where('email', 'admin@localhost')->first();

        $user->ownedTeams()->save(Team::forceCreate([
            'user_id' => $superAdmin->id,
            'name' => $superAdmin->name,
            'personal_team' => true,
        ]));

        $user->ownedTeams()->save(Team::forceCreate([
            'user_id' => $superAdmin->id,
            'name' => 'USER',
            'personal_team' => true,
        ]));
    }
}