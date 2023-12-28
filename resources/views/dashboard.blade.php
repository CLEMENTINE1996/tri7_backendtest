<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Back End Developer Test</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="{{ env('ASSET_URL') }}public/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="{{ env('ASSET_URL') }}public/css/style.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.min.css" rel="stylesheet">

</head>

<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header bg-dark">
            <div class="brand-logo">
                <a href="index.html">
                    <b class="text-white">TRI7 Solutions Test APP</b>
                </a>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->

        <?php 
            $user = App\Models\User
            ::join("persons","persons.id","=","users.person_id")
            ->join("user_type","user_type.id","=","users.usertype_id")->where("users.id", "=", Auth::id())
            ->select("person_id", "type", "lastname", "firstname", "users.usertype_id")
            ->first();
        ?>

        <div class="header">    
            <div class="header-content clearfix">
                
                <div class="nav-control">
                    <div class="hamburger">
                        <span class="toggle-icon"><i class="icon-menu"></i></span>
                    </div>
                </div>
                <div class="header-left">
                    
                </div>
                <div class="header-right">
                    <ul class="clearfix">
                        
                        <li class="icons dropdown d-none d-md-flex">
                            <a href="javascript:void(0)" class="log-user"  data-toggle="dropdown">
                                <span><?php echo ($user->firstname??'') . " " . ($user->lastname??'') . " <b>(". ($user->type??'') .")</b>"; ?></span>
                            </a>
                        </li>
                        <li class="icons dropdown">
                            <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                <span class="activity active"></span>
                                <img src="images/user/1.png" height="40" width="40" alt="">
                            </div>
                            <div class="drop-down dropdown-profile   dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li><a href="/logoutget"><i class="icon-key"></i> <span>Logout</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="nk-sidebar">           
            <div class="nk-nav-scroll">
                <ul class="metismenu" id="menu">
                    <li>
                        <a class="" href="javascript:void()" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">Dashboard</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h4 class="card-title">List of Employees (
                                            <?php 
                                                if($user->usertype_id == 1){
                                                    echo "All Positions";
                                                }
                                                else{
                                                    echo ($user->type??'');
                                                }
                                            ?>)
                                        </h4>
                                    </div>
                                    <div class="col-md-6">
                                        <button data-toggle="modal" data-target="#exampleModal" id="addbtn" class="btn btn-primary pull-right">Add New Employee</button>
                                    </div>
                                </div>
                                
                                <div class="table table-responsive">
                                    <table id="listtable" class="table header-border">
                                        <thead>
                                            <tr>
                                                <th>Last Name</th>
                                                <th >First Name</th>
                                                
                                                <th >Position</th>
                                                <th >Date Created</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php 
                                                if(count($data["data"]) > 0){
                                                    foreach($data["data"] as $userdata){ ?>
                                                    <tr>
                                                        <td>{{ $userdata["lastname"] }}</td>
                                                        <td>{{ $userdata["firstname"] }}</td>
                                                        
                                                        <td><b>{{ $userdata["type"] }}</b></td>
                                                        <td>{{ $userdata["created_at"] }}</td>
                                                        <td>
                                                            <div class="btn-group pull-right">
                                                                <button class="btn btn-sm btn-info editbtn" name="{{ $userdata['id'] }}">Edit</button>
                                                                <button class="btn btn-sm btn-danger deletebtn" name="{{ $userdata['id'] }}">Delete</button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                <?php } }
                                                else{ ?>
                                                    <tr>
                                                        <td class="text-center" colspan="4"><b >No records found.</b></td>
                                                    </tr>
                                               <?php 
                                               }
                                            ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
            <!-- #/ container -->

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <form method="POST"  id="listform" class="modal-content">
                    {{ csrf_field() }}
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">ADD EMPLOYEE</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                        <input type="hidden" id="empid" name="empid" />
                        <div class="col-md-12 mb-3">
                            <label>First Name</label>
                            <input class="form-control" name="firstname" id="firstname" />
                        </div>
                        <div class="col-md-12 mb-3">
                            <label>Last Name</label>
                            <input class="form-control" name="lastname" id="lastname" />
                        </div>
                        <?php if($user->usertype_id == 1){ ?>
                        <div class="col-md-12 mb-3">
                            <label>Position</label>
                            <select class="form-control" name="position_id" id="position_id">
                                <?php 
                                    $positions = App\Models\Position::get();
                                    foreach($positions as $position){ ?>
                                    <option value="{{ $position->id }}">{{ $position->position_name }}</option>
                                <?php    }
                                ?>
                            </select>
                        </div>
                        <?php } ?>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" id="savebtn" class="btn btn-primary">Save</button>
                  </div>
                </form>
              </div>
            </div>

        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <script src="{{ env('ASSET_URL') }}public/plugins/common/common.min.js"></script>
    <script src="{{ env('ASSET_URL') }}public/js/custom.min.js"></script>
    <script src="{{ env('ASSET_URL') }}public/js/settings.js"></script>
    <script src="{{ env('ASSET_URL') }}public/js/gleek.js"></script>
    <script src="{{ env('ASSET_URL') }}public/js/styleSwitcher.js"></script>

    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            $('#listtable').DataTable();

            $("#addbtn").click(function(){
                $("#exampleModalLabel").text("ADD NEW EMPLOYEE");
                $('#listform')[0].reset();
                $("#empid").val("");
            });

            $("#listform").submit(function(e){
                e.preventDefault();
                const formData     = $(this);
                const empid = $("#empid").val();

                $("#savebtn").attr("disabled", "");

                var formmethod = "POST";
                if(empid != ""){
                    formmethod = "PUT";
                }

                $.ajax({
                    method: formmethod,
                    url: "/api/employees/" + empid,
                    data: formData.serialize(),
                    headers: {'Authorization': "Bearer {{ Session::get('sess_token') }}"},
                    success: (result) => {
                        alert(result.message);

                        window.location.reload();
                    },
                    error: (error) => {
                        alert("Server Error");
                        window.location.reload();
                    }
                });
            });

            $(".editbtn").click(function(){
                const empid = $(this).attr("name");
                $.ajax({
                    method: "GET",
                    url: "/api/employees/" + empid,
                    data: {},
                    headers: {'Authorization': "Bearer {{ Session::get('sess_token') }}"},
                    success: (result) => {
                        $("#exampleModalLabel").text("UPDATE EMPLOYEE: " + result.data[0]["firstname"] + " " + result.data[0]["lastname"]);
                        $("#empid").val(result.data[0]["id"]);
                        $("#firstname").val(result.data[0]["firstname"]);
                        $("#lastname").val(result.data[0]["lastname"]);

                        <?php if($user->usertype_id == 1){ ?>
                            $("#position_id").val(result.data[0]["position_id"]);
                        <?php } ?>
                        $("#exampleModal").modal("show");
                    },
                    error: (error) => {
                        alert("Server Error");
                    }
                });
            });

            $(".deletebtn").click(function(){
                if(confirm("Are you sure you want to delete this employee?")){
                    const empid = $(this).attr("name");
                    $.ajax({
                        method: "DELETE",
                        url: "/api/employees/" + empid,
                        data: {},
                        headers: {'Authorization': "Bearer {{ Session::get('sess_token') }}"},
                        success: (result) => {

                            alert(result.message);
                            window.location.reload();
                        },
                        error: (error) => {
                            alert("Server Error");
                            window.location.reload();
                        }
                    });
                }
            });

        });
    </script>

</body>

</html>