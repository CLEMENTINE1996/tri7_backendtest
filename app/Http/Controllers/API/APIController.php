<?php
   
namespace App\Http\Controllers\API;
   
use Illuminate\Http\Request;
use App\Http\Controllers\API\MainController as BaseController;
use App\Models\User;
use App\Models\Person;
use App\Models\Position;
use App\Models\Employee;
use Illuminate\Support\Facades\Auth;
use Validator;
use App\Http\Resources\UserResource as UserResource;
   
class APIController extends BaseController
{
    /**
     * Register api
     *
     * @return \Illuminate\Http\Response
     */

    public static function loadCurrentUser(){
        return User::find(Auth::id()); 
    }

    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'lastname' => 'required',
            'firstname' => 'required',
            'empid' => 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }
   
        $employee = Employee::find($request->empid);

        $current_user = APIController::loadCurrentUser();
        $posid = $request->position_id??$current_user->usertype_id;

        if($employee){
            if($current_user->usertype_id > 1 && $posid != $current_user->usertype_id){
                return $this->sendError('Authorization Error', "You didnt have the authority to update this employee!");  
            }
            else{
                $person = Person::find($employee->person_id);
                $person->firstname = ($request->firstname??$person->firstname);
                $person->lastname = ($request->lastname??$person->lastname);
                

                $employee->position_id = ($request->position_id??$employee->position_id);
                

                if($person->save() && $employee->save()){
                    $success['employee'] =  $person->firstname . " " . $person->lastname; 
                    $success['position'] =  Position::find($employee->position_id)->position_name;
                    $success['date_updated'] = date("M d Y H:m:s");

                    return $this->sendResponse($success, 'Employee successfully updated.');
                }
                else{
                    return $this->sendError('Server Error.', "Failed to update employee");  
                }
            }
        }
        else{
            return $this->sendError('Server Error.', "Failed to update person");  
        }
    }

    public function destroy($id){
        $employee = Employee::find($id);
        if($employee){
            $person = Person::find($employee->person_id);

            $current_user = APIController::loadCurrentUser();
            $posid = $request->position_id??$current_user->usertype_id;

            if($current_user->usertype_id > 1 && $posid != $current_user->usertype_id){
                return $this->sendError('Authorization Error', "You didnt have the authority to delete this employee!");  
            }
            else{
                $empname = $person->firstname . " " . $person->lastname; 
                $emppos = Position::find($employee->position_id)->position_name;

                if($employee->delete() && $person->delete()){

                    $success['employee'] =  $empname;
                    $success['position'] =  $emppos;
                    $success['date_deleted'] = date("M d Y H:m:s");

                    return $this->sendResponse($success, 'Employee successfully deleted.');
                }
                else{
                    return $this->sendError('Server Error.', "Failed to delete employee");  
                }
            }
        }
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'lastname' => 'required',
            'firstname' => 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }
   
        $person = Person::create([
            'lastname' => $request->lastname??'',
            'firstname' => $request->firstname??''
        ]);

        $current_user = APIController::loadCurrentUser();
        $posid = $request->position_id??$current_user->usertype_id;

        if($person){
            if($current_user->usertype_id > 1 && $posid != $current_user->usertype_id){
                return $this->sendError('Authorization Error', "You didnt have the authority to add this employee!");  
            }
            else{
                $employee = Employee::create([
                    'person_id' => $person->id,
                    'position_id' => $posid
                ]);

                if($employee){
                    $success['employee'] =  $person->firstname . " " . $person->lastname; 
                    $success['position'] =  Position::find($employee->position_id)->position_name;
                    $success['date_added'] = date("M d Y H:m:s");

                    return $this->sendResponse($success, 'Employee successfully added.');
                }
                else{
                    return $this->sendError('Server Error.', "Failed to add employee");  
                }
            }
        }
        else{
            return $this->sendError('Server Error.', "Failed to add person");  
        }
    }
   
    public function index()
    {
        $current_user = APIController::loadCurrentUser();

        $users = \DB::table("employees")
        ->join("persons","persons.id","=","employees.person_id")
        ->join("user_type","user_type.id","=","employees.position_id")
        ->where(function($query) use ($current_user) {
            $curr_user_type = $current_user->usertype_id??0;
            if($curr_user_type > 1){
                $query->where('position_id',"=", $curr_user_type);
            }
        })
        ->select("employees.id", "person_id","user_type.type", "employees.created_at", "firstname", "lastname", "position_id")
        ->orderBy("lastname", "asc")
        ->get();
    
        return $this->sendResponse(UserResource::collection($users), 'Users retrieved successfully.');
    }

    public function show($id)
    {
        $current_user = APIController::loadCurrentUser();

        $employee = Employee::find($id);
        if (is_null($employee)) {
            return $this->sendError('Employee not found.');
        }
        else{
            if($current_user->usertype_id > 1 && $employee->position_id != $current_user->usertype_id){
                return $this->sendError('Authorization Error', "You didnt have the authority to view this employee!");  
            }
            else{

                $employee_data = \DB::table("employees")
                ->join("persons","persons.id","=","employees.person_id")
                ->join("user_type","user_type.id","=","employees.position_id")
                ->where("employees.id", "=", $id)
                ->select("employees.id", "person_id","user_type.type", "employees.created_at", "firstname", "lastname", "position_id")
                ->get();

                return $this->sendResponse(UserResource::collection($employee_data), 'Employee retrieved successfully.');
            }
        }
    }

    public function login(Request $request)
    {
        if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){ 
            $user = Auth::user(); 
            $success['token'] =  $user->createToken('MyApp')->accessToken; 
            $success['person_id'] =  $user->person_id;
   
            return $this->sendResponse($success, 'User login successfully.');
        } 
        else{ 
            return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
        } 
    }
}