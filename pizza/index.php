<?php
	require_once 'includes/db.php';
	require_once 'includes/sessions.php';
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

						<?php
							if (mySession_start())
								echo '<a href="lk.php">Личный кабинет</a>';
							else
								echo '<a href="login.php">Войти</a>';
						?>
						
					</div>
				</div>
			</div>

			<!-- КОНТЕНТ -->
			<div class="content">
				<div class="wrapper">
					<table class="catalog-list">
						
						<?php 
							$result = $db->query("SELECT * FROM `restaurant_dish`");
							$items = '';
							$count = $result->rowCount();
							$price = '';
							$img = '';
							
							while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
								$items = $items.', '.$row['dish_tittle'];
								$price = $price.' '.$row['dish_price'];
								$img = $img.' '.$row['dish_img'];
							}

							echo '<script type="text/javascript"> 
								  	dishes_tbl("'.$count.'", "'.$items.'", "'.$price.'", "'.$img.'"); 
								  </script>';  

							$result = null;
						?>

					</table>
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