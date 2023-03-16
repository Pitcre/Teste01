<?php 
   session_start();
 ?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Login</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">

<style>
        
        div.fixed {
         position: fixed;
         height: 50px;
         position: absolute;
         top: 10px;
         right: 0px;
          animation: go-back 1s;
        }
        @keyframes go-back {
            0% {
                transform: translateX(100px);
            }
            100% {
                transform: translateX(0);
            }
        }
       

    </style>

</head>

<body class="bg-gradient-primary" style="background: var(--bs-gray-100);">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-9 col-lg-12 col-xl-10">
                <div class="card shadow-lg o-hidden border-0 my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-flex">
                                <div class="flex-grow-1 bg-login-image" style="background: url(&quot;pics/Estudantes.png&quot;);padding-left: 0px;padding-right: 0px;margin-left: -137px;"></div>
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <p class="clearfix">
                                            <img src="pics/Logo_SGM1.png" class="img-responsive" width="200 px" height="200 px" id="logo" alt="responsive image">
                                        </p>
                                        
                                    </div>
                                   <div class="login-form"> 
                                    <form action="valida-login.php" method="post">
                                        <div class="fixed">
                    <p class="clearfix" style="color: red; position: fixed;">
                                            
                                            <?php
                                                if(isset($_SESSION['loginErro'])){
                                                    echo $_SESSION['loginErro'];
                                                    unset($_SESSION['loginErro']);
                                                }
                                            ?>
                    </p>
                    </div>

                                        
                                        <div class="mb-3">
                                            <input type="text" name="num" class="form-control form-control-user"  placeholder="Digite o seu Nº..."  required="required">

                                        </div>

                                        <div class="mb-3">
                                            <input type="password" name="senha" class="form-control form-control-user" placeholder="Senha" required="required" >

                                        </div>

                                        <div class="mb-3">
                                            <div class="custom-control custom-checkbox small">
                                                <div class="form-check">
                                                    <input class="form-check-input custom-control-input" type="checkbox" id="formCheck-1"><label class="form-check-label custom-control-label" for="formCheck-1">Lembrar-me</label>
                                                </div>
                                        </div>

                                        </div>

                                        <button type="submit" class="btn btn-primary d-block btn-user w-100" style="border-color: #cc5012; background: #cc5012;">Entrar</button>

                                        
                                        <hr>
                                        <hr>
                                    </form>

                                    
                                    </div>
                                    

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>