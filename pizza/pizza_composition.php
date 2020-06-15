<?php
	require_once 'includes/db.php';
	require_once 'includes/sessions.php';
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

						<?php 

							$sql = 'SELECT * FROM restaurant_ingredients WHERE dish_tittle = :dish_tittle';
							$stmt = $db->prepare($sql);

							$dish = $db->query("SELECT * FROM restaurant_dish");

							foreach ($dish as $tittle)
							{	
								$stmt->execute([':dish_tittle' => $tittle['dish_tittle'] ]);
								$ingredients = '';

    							while ($row = $stmt->fetch(PDO::FETCH_ASSOC))
								{	
									$ingredients = $ingredients.', '.$row['ingredient'];
								}

								$ingredients = ltrim($ingredients, ",");

								echo '<div class="pizza-item">
									  	<img src="'.$tittle['dish_img'].'">
									  	<div class="product-composition">
									  		<h3>'.$tittle['dish_tittle'].'</h3>
									  		<b>'.$ingredients.'</b>
									  	</div>
									  </div>';

							}

							$sql = null;
							$stmt = null;
							$dish = null;
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
							<li><a href="index.php">На главную</a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>

	</body>
</html>