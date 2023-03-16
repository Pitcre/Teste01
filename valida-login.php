<?php

session_start();
date_default_timezone_set('Africa/Johannesburg');
$hoje=DATE('Y-m-d H:m:s');
require_once 'conexao.php';

$num = addslashes($_POST['num']);
$senha = addslashes($_POST['senha']);
$md5=md5($senha);
//ESTUDANTE
$estudante= mysqli_query ($conectar,"SELECT * FROM tabela_usuarios join estudante on tabela_usuarios.idUsuario=estudante.idUsuario WHERE num='$num' and senha='$md5' and idNivelAcesso=4");

while ($estudante_consulta = mysqli_fetch_array($estudante)) {
	$id_estudante= $estudante_consulta['idUsuario'];
	$nome_estudante=$estudante_consulta['nome'];
}

if(mysqli_num_rows($estudante) == 1){
	session_start();
	$_SESSION['login'] = true;
	$_SESSION['num'] = $num;
	$_SESSION['idUsuario'] = $id_estudante;
	$_SESSION['nome'] = $nome_estudante;
	header('location:Estudante/index.php');
}
else if(mysqli_num_rows($estudante) == 0){
	//COORDENADOR
	$coordenador= mysqli_query ($conectar,"SELECT * FROM tabela_usuarios join orientador on tabela_usuarios.idUsuario=orientador.idUsuario WHERE num='$num' and senha='$md5' and idNivelAcesso=2");

	while ($coordenador_consulta = mysqli_fetch_array($coordenador)) {
		$id_coordenador= $coordenador_consulta['idUsuario'];
		$nome_coordenador=$coordenador_consulta['nome'];
	}
	if(mysqli_num_rows($coordenador) == 1){
		session_start();
		$_SESSION['login'] = true;
		$_SESSION['num'] = $num;
		$_SESSION['idUsuario'] = $id_coordenador;
		$_SESSION['nome'] = $nome_coordenador;
		$_SESSION['imagem'] = "";
		header('location:Coordenador/index.php');
	}
	else if(mysqli_num_rows($coordenador) == 0){
		//ORIENTADOR
		$orientador= mysqli_query ($conectar,"SELECT * FROM tabela_usuarios join orientador on tabela_usuarios.idUsuario=orientador.idUsuario WHERE num='$num' and senha='$md5' and idNivelAcesso=3");

		while ($orientador_consulta = mysqli_fetch_array($orientador)) {
			$id_orientador= $orientador_consulta['idUsuario'];
			$nome_orientador=$orientador_consulta['nome'];
		}
		if(mysqli_num_rows($orientador) == 1){
			session_start();
			$_SESSION['login'] = true;
			$_SESSION['num'] = $num;
			$_SESSION['idUsuario'] = $id_orientador;
			$_SESSION['nome'] = $nome_orientador;
			$_SESSION['imagem'] = "";
			header('location:Orientador/index.php');
		}
		else if(mysqli_num_rows($orientador) == 0){
			//ADMINISTRADOR
			$admin= mysqli_query ($conectar,"SELECT * FROM tabela_usuarios WHERE email='$num' and senha='$md5' and idNivelAcesso=1");

			while ($admin_consulta = mysqli_fetch_array($admin)) {
				$id_admin= $admin_consulta['idUsuario'];
				$nome_admin=$admin_consulta['nome'];
			}
			if(mysqli_num_rows($admin) == 1){
				session_start();
				$_SESSION['login'] = true;
				$_SESSION['num'] = $num;
				$_SESSION['idUsuario'] = $id_admin;
				$_SESSION['nome'] = $nome_admin;
				$_SESSION['imagem'] = "";
				header('location:Admin/index.php');
			}
			else if(mysqli_num_rows($admin) == 0){
				//Manda o usuario para a tela de login
				$_SESSION['loginErro'] ="					
														<div class='alert alert-danger alert-dismissible fade show' role='alert'>
																<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button> 
																
																Erro: usuario ou senha invalida!
															</div> 
													   ";
				//Manda o usuario para a tela de login
				header("Location: login.php" );
				}

		}
	}
	

}

/*
else{
		//Manda o usuario para a tela de login
			$_SESSION['loginErro'] ="					
													<div class='alert alert-danger alert-dismissible fade show' role='alert'>
															<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button> 
															
															Erro: usuario ou senha invalida!
														</div> 
											   	";
			//Manda o usuario para a tela de login
			header("Location: login.php" );
	}*/

?>