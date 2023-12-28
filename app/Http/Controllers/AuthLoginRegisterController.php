<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use App\Helpers\Http;
use Illuminate\Support\Facades\Route;
use Session;
use GuzzleHttp\Client;

class AuthLoginRegisterController extends Controller
{
    public function __construct()
    {
        $this->middleware('guest')->except([
            'logout','logoutget', 'home'
        ]);
    }


    public function register()
    {
        return view('auth.register');
    }


    public function store(Request $request)
    {
        $request->validate([
            'person_id' => 'required',
            'email' => 'required|email|max:250|unique:users',
            'password' => 'required|min:8|confirmed'
        ]);

        User::create([
            'person_id' => $request->person_id,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ]);

        $credentials = $request->only('email', 'password');
        Auth::attempt($credentials);
        $request->session()->regenerate();
        return redirect()->route('home')
        ->withSuccess('You have successfully registered & logged in!');
    }


    public function login()
    {
        return view('login');
    }

    public function authenticate(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        if(Auth::attempt($credentials))
        {
            $request->session()->regenerate();
            $user = Auth::user(); 
            //$success['token'] =  $user->createToken('MyApp')->accessToken; 
            //$success['person_id'] =  $user->person_id;

            Session::put('sess_token', $user->createToken('MyApp')->accessToken);

            return redirect()->route('home')
                ->withSuccess('You have successfully logged in!');
        }

        return back()->withError('Your provided credentials do not match in our records.');

    } 
    

    public function home(Request $request)
    {
        if(Auth::check())
        {

            /*$requests = Request::create('api/users', 'GET');
            $requests->headers->set('Authorization', 'Bearer ' . Session::get('sess_token'));
            $response = Route::dispatch($requests);
            $data = json_decode($response->getContent(), true);*/

            $response = \App::call('App\Http\Controllers\API\APIController@index');
            $data = json_decode($response->getContent(), true);

            return view('dashboard', compact("data"));
        }
        
        return redirect()->route('login')
            ->withErrors([
            'email' => 'Please login to access the dashboard.',
        ])->onlyInput('email');
    } 
    
    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('login')
            ->withSuccess('You have logged out successfully!');;
    } 

    public function logoutget(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('login')
            ->withSuccess('You have logged out successfully!');;
    }    
}
