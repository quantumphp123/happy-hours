<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Password Reset</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{url('assets/adminlte/plugins/fontawesome-free/css/all.min.css')}}">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="{{url('assets/adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css')}}">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{url('assets/adminlte/dist/css/adminlte.min.css')}}">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="#"><b>Password Reset</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    @if(session('error'))
    <div class="alert bg-danger" role="alert">
      {{session('error')}}
      <button type="button" class="close text-white" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endif
    @if(session('success'))
    <div class="alert bg-primary" role="alert">
      {{session('success')}}
      <button type="button" class="close text-white" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endif
    <div class="card-body login-card-body">
      <p class="login-box-msg">Create new password for your account</p>

      <form method="POST" action="{{route('password-reset-post')}}" name="reset-pass" id="reset-pass">
        @csrf
        <fieldset>
        
           <div class="form-group">
              <h5 class="pull-center form-title" style="font-size: 17px;margin-bottom: 11px;">New Password</h5>
              <input type="password" name="password" id="password" class="form-control input-box" placeholder="New Password" value="{{Cache::get('email')}}">
           </div>
           <div class="form-group">
              <h5 class="pull-center form-title" style="font-size: 17px;margin-bottom: 11px;">Confirm Password</h5>
              <input type="password" name="confirm_password" id="confirm_password" class="form-control input-box" placeholder="Confirm Password" value="{{Cache::get('email')}}">
           </div>
           <input type="hidden" name="token" id="token" value="{{$token}}">
           <div class="col-6">
            <button type="submit" class="btn btn-primary btn-block">Reset Password</button>
          </div>
        </fieldset>
     </form>
     
       

      <!-- /.social-auth-links -->


    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="{{url('assets/adminlte/plugins/jquery/jquery.min.js')}}"></script>
<!-- Bootstrap 4 -->
<script src="{{url('assets/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
<!-- AdminLTE App -->
<script src="{{url('assets/adminlte/dist/js/adminlte.min.js')}}"></script>

</body>
</html>

