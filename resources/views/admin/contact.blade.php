<html lang="en"><head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | Hours Hours</title>
    <!-- External style css -->
    <link rel="stylesheet" href="https://happinesscalculator.online/public/dist/css/style.css">
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!-- Favicon Icon -->
    <link rel="icon" type="image/x-icon" href="https://happinesscalculator.online/public/images/smile.ico">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body>

    <!-- website sections  -->
    <div class="container">
            <!-- website heading -->
    <section class="heading">
        <div>
            <img class="heading_img" src="{{asset('public/smile.png')}}" alt="heading_img">
        </div>
        <div>
            <span>Hours <br>Hours</span>
        </div>
    </section>
    <div class="row justify-content-center d-flex my-5">

        <div class="col-xxl-6 col-md-8 col-sm-12">

            @if (session('success'))
            <div class="card-body ">
                <div class="alert alert-success">
                    <h5>{{ Session::get('success') }}</h5>
                    <?php Session::forget('success');?>
                </div>
            </div>
        @endif
                        <form action="{{ route('contact.store') }}" method="POST">
                            @csrf
                <div class="form-group">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" name="name" id="name" class="form-control @error('name') is-invalid @enderror" value="" placeholder="Enter Name">
                       @error('name')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                </div>
                <div class="form-group">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" name="email" id="email" class="form-control @error('email') is-invalid @enderror" value="" placeholder="Enter Email">
                       @error('email')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
        @enderror
                </div>
                <div class="form-group">
                    <label for="message" class="form-label">Message</label>
                    <textarea name="message" id="message" class="form-control @error('message') is-invalid @enderror" placeholder="Enter your query..." style="height: 110px;">  </textarea>
                     @error('message')
            <span class="invalid-feedback" role="alert">
                <strong>{{ $message }}</strong>
            </span>
        @enderror
                </div>
                <button class="btn btn-info my-3" type="submit">Submit</button>
            </form>
        </div>
    </div>

    </div>

    <!-- footer starts -->
    <footer class="container-fluid" id="footer">
        <div>
            <div class="heading">
                <div>
                    <img class="heading_img" src="{{asset('public/smile.png')}}" alt="smile_img">
                </div>
                <div>
                    <span>Happy <br>Hours</span>
                </div>
            </div>
            <div>
                <p class="footer_description">The Happy Hours is designed to help you find more happiness.</p>
            </div>
        </div>
        <div class="footer_links">
            <span><a href="https://beautyliciousnj.com/happyhours/privacy-policy">Privacy Policy</a></span>
            <span><a href="https://beautyliciousnj.com/happyhours/terms-conditions">Terms of Use</a></span>
            <span class="copyright-text">©
                <script>
                    document.write(new Date().getFullYear())
                </script>2024 Hours Hours. All Rights Reserved.
            </span>
        </div>
    </footer> <!-- footer ends -->

    <!-- additinal bootstrap script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous">
    </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>



</body></html>
