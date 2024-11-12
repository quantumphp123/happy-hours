<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Register</title>
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
  <link rel="stylesheet" href="{{url('assets/adminlte/plugins/summernote/summernote-bs4.css')}}">
  <link rel="stylesheet" href="{{url('assets/adminlte/plugins/toastr/toastr.css')}}">
  <link rel="stylesheet" href="{{url('assets/adminlte/plugins/toastr/toastr.min.css')}}">

   <link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/select2/css/select2.min.css">
<link rel="stylesheet" href="https://adminlte.io/themes/v3/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

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

<div class="content mx-4 my-2">
    <form action="{{route('LocationPost')}}" method="post">
        @csrf
        <div class="mapform" >
            <div class="row">
                <div class="col-5">
                    <input type="hidden" class="form-control" placeholder="lat" name="lat" id="lat">
                </div>
                <div class="col-5">
                    <input type="hidden" class="form-control" placeholder="lng" name="lng" id="lng">
                </div>
            </div>

            <div id="map" style="height:500px; width: 1500px; margin:3px;" class="my-3"></div>

            <script>
                let map;
                function initMap() {
                    map = new google.maps.Map(document.getElementById("map"), {
                        center: { lat: 	33.680302, lng: -116.173897 },
                        zoom: 8,
                        scrollwheel: true,
                    });
                    const uluru = { lat: -34.397, lng: 150.644 };
                    let marker = new google.maps.Marker({
                        position: uluru,
                        map: map,
                        draggable: true
                    });
                    google.maps.event.addListener(marker,'position_changed',
                        function (){
                            let lat = marker.position.lat()
                            let lng = marker.position.lng()
                            $('#lat').val(lat)
                            $('#lng').val(lng)
                        })
                    google.maps.event.addListener(map,'click',
                    function (event){
                        pos = event.latLng
                        marker.setPosition(pos)
                    })
                }
            </script>
            <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD2R1G_wLlzlfGUkaQPAoFMuZeJPTC4ReI&callback=initMap"
                    type="text/javascript"></script>
        </div>

        <button type="submit" class="m -2 btn btn-primary">Confirm Location</button>
    </form>


</div>

</html>
