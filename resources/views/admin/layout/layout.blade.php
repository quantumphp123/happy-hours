<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Bidding Plateform</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{url('assets/adminlte/plugins/fontawesome-free/css/all.min.css')}}">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bbootstrap 4 -->
  <link rel="stylesheet" href="{{url('assets/adminlte/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css')}}">
  <!-- iCheck -->
  <link rel="stylesheet" href="{{url('assets/adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css')}}">
  <!-- JQVMap -->
  <link rel="stylesheet" href="{{url('assets/adminlte/plugins/jqvmap/jqvmap.min.css')}}">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{url('assets/adminlte/dist/css/adminlte.min.css')}}">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="{{url('assets/adminlte/plugins/overlayScrollbars/css/OverlayScrollbars.min.css')}}">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="{{url('assets/adminlte/plugins/daterangepicker/daterangepicker.css')}}">
  <!-- summernote -->
  <link rel="stylesheet" href="{{ url('assets/adminlte/plugins/toastr/toastr.min.css') }}">
  <link rel="stylesheet" href="{{url('assets/adminlte/plugins/summernote/summernote-bs4.css')}}">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <!-- Option 1: Include in HTML -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

  <link rel="stylesheet" href="{{url('assets/adminlte/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}}">
  <link rel="stylesheet" href="{{url('assets/adminlte/plugins/datatables-responsive/css/responsive.bootstrap4.min.css')}}">


    <link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!-- Google tag (gtag.js) -->	<script async src="https://www.googletagmanager.com/gtag/js?id=G-2NK1NWYS84"></script>	<script>	  window.dataLayer = window.dataLayer || [];	  function gtag(){dataLayer.push(arguments);}	  gtag('js', new Date());	  gtag('config', 'G-2NK1NWYS84');	</script>

</head>
<body class="hold-transition sidebar-mini layout-fixed">

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

<style>
.headertop{
	background:#f2f2f2;
}
</style>

<style>
.nav-tabs.flex-column {
  border-right: none;
  
}
.nav-tabs.flex-column .nav-link {
    border-bottom-left-radius: 0.25rem;
    border-top-right-radius: 0;
    margin-right: -7px;
    margin-left: -7px;
	/*border-left: 10px solid blue;*/
}
.nav-tabs.flex-column .nav-item.show .nav-link, .nav-tabs.flex-column .nav-link.active {
   border-left: 5px solid blue;
}

.custom-switch .custom-control-label::before {
    left: -2.25rem;
    width: 53px;
    height: 26px;
    pointer-events: all;
    border-radius: 0.5rem;
}

.custom-switch .custom-control-label::after {
    top: 10px;
    left: -26px;
    width: 17px;
    height: 16px;
    background-color: #adb5bd;
    border-radius: 0.5rem;
    transition: background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out,-webkit-transform .15s ease-in-out;
    transition: transform .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    transition: transform .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out,-webkit-transform .15s ease-in-out;
}
.custom-control-label::after {
    position: absolute;
    top: 0.25rem;
    left: -1.5rem;
    display: block;
    width: 1rem;
    height: 1rem;
    content: "";
    background: no-repeat 50%/50% 50%;
}


</style>



@include('admin.partials.header')



@yield('content')


    <!-- Start Footer Area -->
@include('admin.partials.footer')


<script src="{{ url('assets/adminlte/plugins/toastr/toastr.min.js') }}"></script>
 <script>
        @if (Session::has('error'))
            toastr.error("{{ Session::get('error') }}");
        @endif
        @if (Session::has('success'))
            toastr.success("{{ Session::get('success') }}");
        @endif
    </script>
@yield('script')

</body>
</html>
