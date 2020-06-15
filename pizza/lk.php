<?php
	require_once 'includes/sessions.php';

	if (!mySession_start())
	{
		header("location: login.php");
	}

?>

<!DOCTYPE HTML>

<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>Доставка пиццы. Заказать пиццу онлайн на дом и в офис. От пиццерии Мир пиццы.</title>
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
						<a href="logout.php">Выйти</a>
					</div>
				</div>
			</div>

			<!-- КОНТЕНТ -->
			<div class="content">
				<div class="wrapper">

					<b>Добро пожаловать!</b>

					<?php 

						$sql = 'SELECT * FROM restaurant_users 
								INNER JOIN restaurant_accounts ON restaurant_accounts.user_id = restaurant_users.u_id 
								INNER JOIN restaurant_session ON restaurant_session.acc_id = restaurant_accounts.acc_id 
								INNER JOIN restaurant_availability ON restaurant_availability.acc_id = restaurant_accounts.acc_id
								WHERE restaurant_session.session_id = :sess_id';
						$stmt = $db->prepare($sql);
 						$stmt->execute([':sess_id' => $_COOKIE['SESSID']]);
 						$user = $stmt->fetch(PDO::FETCH_OBJ);

 						echo '<br>Вы вошли на сайт, как <u>'.$user->u_name.'</u>
 							  <br>На вашем счету '.$user->amount.' ₽
 							 ';

 						if ($user->u_role == 'admin')
 						{

 							echo "<br><br>Меню:
 							  <br><a href='orders.php'> Заказы</a>
 							";
 						
 						}
 		
					?>

					
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
							<li><a href="pizza_composition.php">Узнать состав пицц</a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>

	</body>
</html>