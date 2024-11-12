<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
     
    </ul>

   
    
  </nav>
  <!-- /.navbar -->
  <style>
    .sidebar-mini.sidebar-collapse .brand-text{
        display:none;
    }
  </style>
  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{route('admin-dashboard')}}" class="brand-link d-flex flex-row align-items-center">
      <img src="{{ url('assets/adminlte/dist/img/HappyHour.jpeg') }}" alt="Happy Hours Guide of the Desert" class="brand-image img-circle elevation-3" style="width:fit-content">
      <span class="brand-text font-weight-bold text-wrap">Happy Hours Guide of the Desert</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
            <img src="{{ url('assets/adminlte/dist/img/AdminLTELogo.png') }}" alt="AdminLTE Logo" class="brand-image img-circle elevation-3">
            </div>
            <div class="info">
             <a href="#" class="d-block">Welcome Admin</a>
            </div>
        </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
         
			<li class="nav-item">
			  <a href="{{url('admin-dashboard')}}" class="nav-link">
			    <i class="nav-icon bi bi-speedometer elevation-2"></i>
			   <p>Dashboard</p>
			  </a>
			</li>
			
			
			<li class="nav-item">
			  <a href="{{url('users')}}" class="nav-link">
			      <i class="nav-icon bi bi-people elevation-2"></i>
			   <p>Users</p>
			  </a>
			</li>
			
			
			<li class="nav-item">
			  <a href="{{url('category')}}" class="nav-link">
			      <i class="nav-icon bi bi-list-ul elevation-2"></i>
			   <p>Categories</p>
			  </a>
			</li>
			<li class="nav-item">
			  <a href="{{url('places')}}" class="nav-link">
			      <i class="nav-icon bi bi-geo elevation-2"></i>
			   <p>Places</p>
			  </a>
			</li>
			
			<li class="nav-item">
			  <a href="{{url('logout')}}" class="nav-link">
			      <i class="nav-icon bi bi-box-arrow-right elevation-2"></i>
			   <p>Log Out</p>
			  </a>
			</li>
         
          
         
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>