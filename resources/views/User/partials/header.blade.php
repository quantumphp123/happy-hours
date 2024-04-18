<style>
    li{
        color:#fff;
    }
    .bg-black{
        /* Created with https://www.css-gradient.com */
        background: #7440AD;
        background: -webkit-linear-gradient(top left, #7440AD, #521ECC);
        background: -moz-linear-gradient(top left, #7440AD, #521ECC);
        background: linear-gradient(to bottom right, #7440AD, #521ECC);
    }
    .sidebar-mini.sidebar-collapse .brand-text{
        display:none;
    }
</style>
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand bg-black navbar-dark">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>

    </ul>



  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-priy elevation-4">
    <!-- Brand Logo -->
    <a href="{{route('User.Dashboard')}}" class="brand-link bg-black d-flex flex-row align-items-center">
      <img src="{{url('assets/adminlte/dist/img/HappyHour.jpeg')}}" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="width:fit-content;">
      <span class="brand-text font-weight-bold text-wrap">Happy Hours Guide of the Desert</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar bg-black">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">

        <div class="info  ">
          <span href="#" style="color:#fff" class="d-block">Welcome User</span>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

            <li class="nav-item">
              <a href="{{route('User.Dashboard')}}" class="nav-link text-white">
                <i class="fa fa-id-card"></i>
                <p>Profile</p>
              </a>
            </li>


            <li class="nav-item">
              <a href="{{route('UserOffers')}}" class="nav-link text-white">
                  <i class="fas fa-tags"></i>
               <p>Offers</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="{{route('user.reviews')}}" class="nav-link text-white">
                  <i class="fas fa-star"></i>
               <p>Reviews</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="{{route('User.notifications')}}" class="nav-link text-white">
                  <i class="fas fa-bell"></i>
                                   <p>Notifications</p>
              </a>
            </li>
            
            <li class="nav-item">
              <a href="{{route('User.gallery')}}" class="nav-link text-white">
                <i class="fa fa-images"></i>
               <p>Gallery</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="{{route('user.availability')}}" class="nav-link text-white">
                <i class="fa fa-calendar"></i>
               <p>Business Hours</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="{{route('user.categories')}}" class="nav-link text-white">
                <i class="fa fa-copy"></i>
               <p>Update Categories</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="{{route('User.profile')}}" class="nav-link text-white">
                <i class="fa fa-edit"></i>
               <p>Update Profile</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="{{route('user.details')}}" class="nav-link text-white">
                <i class="fa fa-info-circle"></i>
               <p>Update Details</p>
              </a>
            </li>

            <li class="nav-item">

              <a href="{{route('User.change_pass')}}" class="nav-link text-white">
                <i class="fa fa-key"></i>
               <p>Change password</p>
              </a>
            </li>

            <li class="nav-item">
              <a href="{{route('User.logout')}}" class="nav-link text-white">
                  <i class="fas fa-sign-out-alt"></i>
               <p>Log Out</p>
              </a>
            </li>



        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
