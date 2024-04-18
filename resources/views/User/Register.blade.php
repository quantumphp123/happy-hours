<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Register</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{ url('assets/adminlte/plugins/fontawesome-free/css/all.min.css') }}">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet"
        href="{{ url('assets/adminlte/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css') }}">
    <!-- iCheck -->
    <link rel="stylesheet" href="{{ url('assets/adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css') }}">
    <!-- JQVMap -->
    <link rel="stylesheet" href="{{ url('assets/adminlte/plugins/jqvmap/jqvmap.min.css') }}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ url('assets/adminlte/dist/css/adminlte.min.css') }}">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="{{ url('assets/adminlte/plugins/overlayScrollbars/css/OverlayScrollbars.min.css') }}">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="{{ url('assets/adminlte/plugins/daterangepicker/daterangepicker.css') }}">
    <!-- summernote -->
    <link rel="stylesheet" href="{{ url('assets/adminlte/plugins/summernote/summernote-bs4.css') }}">
    <link rel="stylesheet" href="{{ url('assets/adminlte/plugins/toastr/toastr.css') }}">
    <link rel="stylesheet" href="{{ url('assets/adminlte/plugins/toastr/toastr.min.css') }}">

    <link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/select2/css/select2.min.css">
    <link rel="stylesheet"
        href="https://adminlte.io/themes/v3/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
    <style>
        .select2-container--default .select2-selection--multiple .select2-selection__choice {
            background-color: blue;
            border: 1px solid #aaa;
            border-radius: 4px;
            cursor: default;
            float: left;
            margin-right: 5px;
            margin-top: 5px;
            padding: 0 5px;
        }
    </style>
</head>


<body class="hold-transition login-page">
    <div class="container my-5">
        <div class="card card-primary">
            <div class="card-header">
                <h3 class="card-title">Register Company</h3>
            </div>
            <form action="{{ route('register_post') }}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="name">Business Name</label>
                                <input type="text" value="{{ old('name') }}" class="form-control @error('name') is-invalid @enderror" name="name"
                                    placeholder="Enter Name" id="name">
                                @error('name')
                                    <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="email">Business Email</label>
                                <input type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}"
                                    placeholder="Enter email" id="email">
                                @error('email')
                                    <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-sm-12">
                            <div class="form-group">
                                <label for="business_owner_name" class="form-label">Business
                                    <span>
                                        <select name="business_owner_type" class="form-control @error('business_owner_type') is-invalid @enderror" style="display: inline-block;width:fit-content;">
                                            <option value="owner" {{ old('business_owner_type') == "owner" ? "selected" : "" }}>Owner</option>
                                            <option value="manager" {{ old('business_owner_type') == "manager" ? "selected" : "" }}>Manager</option>
                                        </select>
                                    </span>
                                    Name:
                                </label>
                                <input type="text" class="form-control @error('business_owner_name') is-invalid @enderror" name="business_owner_name" id="business_owner_name" value="{{ old('business_owner_name') }}">
                                @error('business_owner_name')
                                    <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                @enderror
                                @error('business_owner_type')
                                    <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-lg-6 col-sm-12" style="padding-top: 13px;">
                            <div class="form-group">
                                <label for="location">Business Location</label>
                                <select class="form-control @error('location') is-invalid @enderror" name="location" id="location">
                                    <option value="" {{ old('location') == "" ? "selected" : "" }} disabled>Choose Location</option>
                                    <option value="Palm Springs" {{ old('location') == "Palm Springs" ? "selected" : "" }}>Palm Springs</option>
                                    <option value="Cathedral City" {{ old('location') == "Cathedral City" ? "selected" : "" }}>Cathedral City</option>
                                    <option value="Rancho Mirage" {{ old('location') == "Rancho Mirage" ? "selected" : "" }}>Rancho Mirage</option>
                                    <option value="Palm Desert" {{ old('location') == "Palm Desert" ? "selected" : "" }}>Palm Desert</option>
                                    <option value="Indian Wells" {{ old('location') == "Indian Wells" ? "selected" : "" }}>Indian Wells</option>
                                    <option value="Bermuda Dunes" {{ old('location') == "Bermuda Dunes" ? "selected" : "" }}>Bermuda Dunes</option>
                                    <option value="La Quinta" {{ old('location') == "La Quinta" ? "selected" : "" }}>La Quinta</option>
                                    <option value="Indio" {{ old('location') == "Indio" ? "selected" : "" }}>Indio</option>
                                    <option value="Coachella" {{ old('location') == "Coachella" ? "selected" : "" }}>Coachella</option>
                                    <option value="Desert hot springs" {{ old('location') == "Desert hot springs" ? "selected" : "" }}>Desert hot springs</option>
                                </select>
                                @error('location')
                                    <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-sm-12">
                            <div class="form-group">
                                <label for="mobile">Business Phone Number</label>
                                <input type="text" class="form-control @error('mobile') is-invalid @enderror" name="mobile" value="{{ old('mobile') }}"
                                    placeholder="10 digit contact number" id="mobile">
                                @error('mobile')
                                    <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-lg-6 col-sm-12">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Business Website</label> 
                                <input type="text" class="form-control @error('website') is-invalid @enderror" name="website" value="{{ old('website') }}"
                                    placeholder="e.g., www.happyhours.com">
                                @error('website')
                                    <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="category">Category</label>
                        <select class="category-select" name="category[]" style="width:100%" multiple id="category">
                            @foreach ($categories as $key => $item)
                                <option value="{{ $key }}" {{ in_array($key, old('category', [])) ? 'selected' : '' }}> {{ $item }}</option>
                            @endforeach
                        </select>
                        @error('category')
                            <span class="text-danger text-center mt-1">*{{ $message }}</span>
                        @enderror
                    </div>
                    <label>Address</label>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Street Number</label>
                                <input type="text" value="{{ old('streetnumber') }}" class="form-control"
                                    name="streetnumber" placeholder="Enter Street Number">
                                @error('streetnumber')
                                    <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Street Name</label>
                                <input type="text" class="form-control @error('streetname') is-invalid @enderror" name="streetname"
                                    value="{{ old('streetname') }}" placeholder="Enter Street Name">
                                @error('streetname')
                                    <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="city">City</label>
                                <!--<input type="text" class="form-control"name="city" value="{{ old('location') }}" id="exampleInputEmail1" placeholder="Enter City">-->
                                <select class="form-control" name="city" id="city">
                                    <option value="" {{ old('city') == "" ? "selected" : "" }} disabled>Choose City</option>
                                    <option value="Palm Springs" {{ old('city') == "Palm Springs" ? "selected" : "" }}>Palm Springs</option>
                                    <option value="Cathedral City" {{ old('city') == "Cathedral City" ? "selected" : "" }}>Cathedral City</option>
                                    <option value="Rancho Mirage" {{ old('city') == "Rancho Mirage" ? "selected" : "" }}>Rancho Mirage</option>
                                    <option value="Palm Desert" {{ old('city') == "Palm Desert" ? "selected" : "" }}>Palm Desert</option>
                                    <option value="Indian Wells" {{ old('city') == "Indian Wells" ? "selected" : "" }}>Indian Wells</option>
                                    <option value="Bermuda Dunes" {{ old('city') == "Bermuda Dunes" ? "selected" : "" }}>Bermuda Dunes</option>
                                    <option value="La Quinta" {{ old('city') == "La Quinta" ? "selected" : "" }}>La Quinta</option>
                                    <option value="Indio" {{ old('city') == "Indio" ? "selected" : "" }}>Indio</option>
                                    <option value="Coachella" {{ old('city') == "Coachella" ? "selected" : "" }}>Coachella</option>
                                    <option value="Desert Hot Springs" {{ old('city') == "Desert hot springs" ? "selected" : "" }}>Desert Hot Springs</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="zipcode">Zip Code</label>
                                <input type="text" class="form-control"name="zipcode" value="{{ old('zipcode') }}" placeholder="Enter ZipCode" id="zipcode">
                                @error('zipcode')
                                    <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="landmark">Land-Mark</label>
                        <input type="text" class="form-control" name="landmark" value="{{ old('landmark') }}"
                            placeholder="Enter Land-Mark" id="landmark">
                        @error('landmark')
                            <span class="text-danger text-center mt-1">*{{ $message }}</span>
                        @enderror
                    </div>
                    <div class="row">
                        <div class="col-sm-12" id="details-section">
                            @if(old('service'))
                            @foreach(old('service') as $service)
                                <label for="service" class="col-sm-2 col-form-label">Add detail</label>
                                <div class="form-group row mb-2 increment">
                                    <div class="col-sm-11">
                                        <input type="text" class="form-control service"name="service[]" placeholder="Enter Detail" id="service" value="{{ $service }}">
                                    </div>
                                    <div class="col-sm-1 text-center my-auto">
                                        <button class="btn btn-success btn-xs sharp" id="add" type="button"><i class="fas fa-plus"></i></button>
                                    </div>
                                </div>
                            @endforeach
                            @else
                                <label for="service" class="col-sm-2 col-form-label">Add detail</label>
                                <div class="form-group row mb-2 increment">
                                    <div class="col-sm-11">
                                        <input type="text" class="form-control service"name="service[]" placeholder="Enter Detail" id="service" >
                                    </div>
                                    <div class="col-sm-1 text-center my-auto">
                                        <button class="btn btn-success btn-xs sharp" id="add" type="button"><i class="fas fa-plus"></i></button>
                                    </div>
                                </div>
                            @endif
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-sm-12">
                            <div class="form-group">
                                <label>Marketing contact's email</label>
                                <input type="email" class="form-control"name="marketing_email"
                                    value="{{ old('marketing_email') }}"
                                    placeholder="Enter marketing contact's email">
                                @error('marketing_email')
                                    <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-12">
                            <div class="form-group">
                                <label>Marketing Name</label>
                                <input type="text" class="form-control"name="marketing_name"
                                    value="{{ old('marketing_name') }}"
                                    placeholder="Enter marketing name">
                                @error('marketing_name')
                                    <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-12">
                            <div class="form-group">
                                <label>Marketing contact's phone</label>
                                <input type="tel" class="form-control" name="marketing_phone"
                                    value="{{ old('marketing_phone') }}" placeholder="Enter marketing contact's phone">
                                @error('marketing_phone')
                                    <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Image</label>
                        <input type="file" class="form-control" name="image">
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <textarea class="form-control" oninput="countWord()" name="desc" id="word" placeholder= "Describe in 300 characters only" maxlength="300">{{ old('desc') }}</textarea>
                        @error('desc')
                            <span class="text-danger text-center mt-1">*{{ $message }}</span>
                        @enderror
                        <p align="right">
                            <span id="show">0</span>
                            / 300
                        </p>
                    </div>
                    <script>
                        function countWord() {
                            var words = document
                                .getElementById("word").value;
                            var count = words.length;
                            document.getElementById("show")
                                .innerHTML = count;
                        }
                    </script>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Password</label>
                        <input type="password" class="form-control" name="password"placeholder="Password">
                        @error('password')
                            <span class="text-danger text-center mt-1">*{{ $message }}</span>
                        @enderror
                    </div>


                </div>

                <div class="card-footer">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
    <!-- /.login-box -->

    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- Bootstrap 4 -->
    <script src="{{ url('assets/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <!-- AdminLTE App -->
    <script src="{{ url('assets/adminlte/dist/js/adminlte.min.js') }}"></script>
    <script src="https://adminlte.io/themes/v3/plugins/select2/js/select2.full.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.category-select').select2({
                placeholder: "Select categories",
                allowClear: true
            });
        });


        $(document).ready(function() {
            
            $("#add").click(function() {
                
                var newService = `<div class="form-group row mb-2" id="new-service-row">
                                    <div class="col-sm-11">
                                        <input type="text" class="form-control service"name="service[]" placeholder="Enter Detail">
                                    </div>
                                    <div class="col-sm-1 text-center my-auto">
                                        <button class="btn btn-danger btn-xs sharp" id="remove" type="button"><i class="fas fa-minus"></i></button>
                                    </div>
                                </div>`;
                                
                                $('#details-section').append(newService);
            });
            $("body").on("click", "#remove", function() {
                $(this).parents("#new-service-row").remove();
            });
        });
    </script>

</body>

</html>
