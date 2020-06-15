<?php
	require_once 'includes/sessions.php';
	if (mySession_start())
	{
		header("location: lk.php");
	}
	
	if (isset($_POST['log_in'])) 
	{
		$login = htmlspecialchars( trim($_POST['login']) ); 
		$password = htmlspecialchars( trim($_POST['password']) );

		if (!empty($login) && !empty($password))
		{
			$sql = 'SELECT acc_id, acc_password FROM restaurant_accounts WHERE acc_email = :login';
			$params = [':login' => $login];
			$stmt = $db->prepare($sql);
			$stmt->execute($params);

			$user = $stmt->fetch(PDO::FETCH_OBJ);

			if ($user) 
			{
				if ($user->acc_password == md5($password))
				{
					mySession_write($user->acc_id);
					header('Location: lk.php');
				}
				else
					echo "Неверный логин или пароль!"; 
			}
			else
				echo "Пользователь не найден!";
		}
		else
			echo "Неверно задан логин или пароль!"; 
	}
					
?>
<!DOCTYPE HTML>

<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>Доставка пиццы. Заказать пиццу онлайн на дом и в офис. От пиццерии Мир пиццы</title>
		<link rel="shortcut icon" href="img/favicon.ico">
		<link rel="stylesheet" href="css/style.css" >
		<script src="js/item.js" language="javascript"></script>
	</head>

	<body>
	
		<div class="cn">

			<!-- Навигация -->
			<div class="navigation">
				<div class="wrapper">
					<div class="menu">
						<a href="index.php">Главная</a>
						<a href="cart.php">Корзина</a>
					</div>
				</div>
			</div>

			<!-- КОНТЕНТ -->
			<div class="content">
				<div class="wrapper">
					
					<div class="auth">
						<form action="" method="post">
 							Логин: <input type="text" name="login" />
 							Пароль: <input type="password" name="password" />
 							<input type="submit" value="Войти" name="log_in" />
						</form>
					</div>
				</div>
			</div>

			<!-- ПОДВАЛ -->
			<div class="footer">
				<div class="wrapper">

					<ul class="head">
						<li><div class="copyright">
					 		<b>Мир пиццы <span>&copy; 2020</span></b>
							<span>Заказ пиццы на дом и в офис: бесплатная доставка.</span>
						</div></li>
						<li><div class="phone">
							<b>8 800 800-80-80</b>
							<span>Звонок бесплатный</span>
						</div></li>
					</ul>

					<div class="bottom">
						<ul>
							<li><a href="index.php">На главную</a></li>
							<li><a href="pizza_composition.php">Узнать состав пицц</a></li>
						</ul>
					</div>

				</div>
			</div>	
		</div>
	</body>
</html>
		
