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
    <link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
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
        .calendar-table{
            display:none;
        }
    </style>
</head>


<body class="hold-transition login-page">
    <div class="container my-5">
        <div class="card card-primary">
            <div class="card-header">
                <h3 class="card-title">Add schedule</h3>
            </div>

            <form class="form-horizontal p-4" method="POST" action="{{ route('user-availability') }}"
                name="update_time" id="update_time">
                @csrf
                <div class="form-card">
                    <h2 class="fs-title-1">Select Your Day Availabliity</h2>

                    <div class="col-md-12 mt-4">
                        <h5>Monday</h5>
                        <span id="err_monday" class="text-danger text-left"></span>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Start</label>

                                    <div class="input-group">
                                        <input type="text" value="{{ old('start_time1') }}" name="start_time1" class="form-control timepicker">
                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>

                                    </div>
                                    @error('end_time')
                                        <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                    @enderror
                                    <!-- /.input group -->
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>End:</label>

                                    <div class="input-group">
                                        <input type="text" value="{{ old('end_time1') }}" name="end_time1"
                                            class="form-control timepicker">

                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>

                                    </div>
                                    @error('end_time')
                                        <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                    @enderror
                                    <!-- /.input group -->
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-12 mt-4">
                        <h5>Tuesday</h5>
                        <span id="err_tuesday" class="text-danger text-left"></span>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Start</label>

                                    <div class="input-group">
                                        <input type="text" value="{{ old('start_time2') }}" name="start_time2"
                                            class="form-control timepicker">

                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>

                                    </div>
                                    @error('end_time')
                                        <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                    @enderror
                                    <!-- /.input group -->
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>End:</label>

                                    <div class="input-group">
                                        <input type="text" value="{{ old('end_time2') }}" name="end_time2"
                                            class="form-control timepicker">

                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>

                                    </div>
                                    @error('end_time')
                                        <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                    @enderror
                                    <!-- /.input group -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 mt-4">
                        <h5>Wednesday</h5>
                        <span id="err_friday" class="text-danger text-left"></span>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Start</label>

                                    <div class="input-group">
                                        <input type="text" value="{{ old('start_time3') }}" name="start_time3"
                                            class="form-control timepicker">

                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>

                                    </div>
                                    @error('end_time')
                                        <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                    @enderror
                                    <!-- /.input group -->
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>End:</label>

                                    <div class="input-group">
                                        <input type="text" value="{{ old('end_time3') }}" name="end_time3"
                                            class="form-control timepicker">

                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>

                                    </div>
                                    @error('end_time')
                                        <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                    @enderror
                                    <!-- /.input group -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 mt-4">
                        <h5>Thursday</h5>
                        <span id="err_friday" class="text-danger text-left"></span>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Start</label>

                                    <div class="input-group">
                                        <input type="text" value="{{ old('start_time4') }}" name="start_time4"
                                            class="form-control timepicker">

                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>

                                    </div>
                                    @error('end_time')
                                        <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                    @enderror
                                    <!-- /.input group -->
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>End:</label>

                                    <div class="input-group">
                                        <input type="text" value="{{ old('end_time4') }}" name="end_time4"
                                            class="form-control timepicker">

                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>

                                    </div>
                                    @error('end_time')
                                        <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                    @enderror
                                    <!-- /.input group -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 mt-4">
                        <h5>Friday</h5>
                        <span id="err_friday" class="text-danger text-left"></span>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Start</label>

                                    <div class="input-group">
                                        <input type="text" value="{{ old('start_time5') }}" name="start_time5"
                                            class="form-control timepicker">

                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>

                                    </div>
                                    @error('end_time')
                                        <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                    @enderror
                                    <!-- /.input group -->
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>End:</label>

                                    <div class="input-group">
                                        <input type="text" value="{{ old('end_time5') }}" name="end_time5"
                                            class="form-control timepicker">

                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>

                                    </div>
                                    @error('end_time')
                                        <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                    @enderror
                                    <!-- /.input group -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 mt-4">
                        <h5>Saturday</h5>
                        <span id="err_saturday" class="text-danger text-left"></span>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Start</label>

                                    <div class="input-group">
                                        <input type="text" value="{{ old('start_time6') }}" name="start_time6"
                                            class="form-control timepicker">

                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>

                                    </div>
                                    @error('end_time')
                                        <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                    @enderror
                                    <!-- /.input group -->
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>End:</label>

                                    <div class="input-group">
                                        <input type="text" value="{{ old('end_time6') }}" name="end_time6"
                                            class="form-control timepicker">

                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>

                                    </div>
                                    @error('end_time')
                                        <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                    @enderror
                                    <!-- /.input group -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 mt-4">
                        <h5>Sunday</h5>
                        <span id="err_sunday" class="text-danger text-left"></span>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Start</label>

                                    <div class="input-group">
                                        <input type="text" value="{{ old('start_time7') }}" name="start_time7"
                                            class="form-control timepicker">

                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>

                                    </div>
                                    @error('end_time')
                                        <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                    @enderror
                                    <!-- /.input group -->
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>End:</label>

                                    <div class="input-group">
                                        <input type="text" value="{{ old('end_time7') }}" name="end_time7" class="form-control timepicker">

                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                        </div>

                                    </div>
                                    @error('end_time')
                                        <span class="text-danger text-center mt-1">*{{ $message }}</span>
                                    @enderror
                                    <!-- /.input group -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="submit" class="action-button btn btn-primary mt-5" value="Submit" />
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
    <script src="{{url('assets/adminlte/plugins/moment/moment.min.js')}}"></script>
    <script src="{{url('assets/adminlte/plugins/daterangepicker/daterangepicker.js')}}"></script>
    <script>
        $(document).ready(function() {
            $('.category-select').select2();
            $('.timepicker').daterangepicker({
              timePicker: true,
              timePickerIncrement: 15,
              singleDatePicker: true,
              showDropdowns: true,
              timePicker24Hour: true,
              locale: {
                format: 'HH:mm'
              }
            });
        });
    </script>

</body>

</html>
