-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 13 2020 г., 22:06
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bd`
--

-- --------------------------------------------------------

--
-- Структура таблицы `restaurant_accounts`
--

CREATE TABLE `restaurant_accounts` (
  `acc_id` varchar(36) NOT NULL,
  `acc_email` varchar(255) NOT NULL,
  `acc_password` varchar(32) NOT NULL,
  `acc_registration` datetime NOT NULL,
  `user_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `restaurant_accounts`
--

INSERT INTO `restaurant_accounts` (`acc_id`, `acc_email`, `acc_password`, `acc_registration`, `user_id`) VALUES
('asffg43sdfnb3', 'arcuser@mail.ru', 'e10adc3949ba59abbe56e057f20f883e', '2020-06-11 00:00:00', 'd0b981bc-f8bd-11e8-b1e0-ac5043edbccf'),
('asfga34aee23', 'vasyaadmin@mail.ru', 'e10adc3949ba59abbe56e057f20f883e', '2020-06-11 00:00:00', 'd0b97862-f8bd-11e8-b1e0-ac5043edbccf');

--
-- Триггеры `restaurant_accounts`
--
DELIMITER $$
CREATE TRIGGER `generate_id` BEFORE INSERT ON `restaurant_accounts` FOR EACH ROW BEGIN
	IF ISNULL(NEW.acc_id) THEN
 		SET NEW.acc_id = UUID();
 	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `restaurant_availability`
--

CREATE TABLE `restaurant_availability` (
  `acc_id` varchar(36) NOT NULL,
  `amount` decimal(6,2) NOT NULL,
  `card_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `restaurant_availability`
--

INSERT INTO `restaurant_availability` (`acc_id`, `amount`, `card_number`) VALUES
('asffg43sdfnb3', '1000.00', '1234567890987654'),
('asfga34aee23', '1000.00', '987653210987654');

-- --------------------------------------------------------

--
-- Структура таблицы `restaurant_cart`
--

CREATE TABLE `restaurant_cart` (
  `session_id` varchar(36) DEFAULT NULL,
  `order_id` varchar(36) DEFAULT NULL,
  `price` decimal(6,2) NOT NULL,
  `count` int(11) NOT NULL,
  `dish_tittle` varchar(255) NOT NULL,
  `acc_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `restaurant_cart`
--

INSERT INTO `restaurant_cart` (`session_id`, `order_id`, `price`, `count`, `dish_tittle`, `acc_id`) VALUES
(NULL, '5ee27ffaf082a', '395.00', 1, 'Мексиканская', 'asfga34aee23');

-- --------------------------------------------------------

--
-- Структура таблицы `restaurant_dish`
--

CREATE TABLE `restaurant_dish` (
  `dish_tittle` varchar(255) NOT NULL,
  `dish_price` decimal(6,2) NOT NULL,
  `dish_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `restaurant_dish`
--

INSERT INTO `restaurant_dish` (`dish_tittle`, `dish_price`, `dish_img`) VALUES
('Мексиканская', '395.00', 'img/p_1.jpg'),
('Морская', '395.00', 'img/p_5.jpg'),
('Мясная', '395.00', 'img/p_4.jpg'),
('Сальса', '345.00', 'img/p_2.jpg'),
('Супермясная', '445.00', 'img/p_3.jpg'),
('Цеплёнок барбекю', '395.00', 'img/p_8.jpg'),
('Четыре сезона', '345.00', 'img/p_6.jpg'),
('Чизбургер-пицца', '345.00', 'img/p_7.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `restaurant_ingredients`
--

CREATE TABLE `restaurant_ingredients` (
  `dish_tittle` varchar(255) NOT NULL,
  `ingredient` varchar(255) NOT NULL,
  `unit` varchar(11) NOT NULL,
  `weight` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `restaurant_ingredients`
--

INSERT INTO `restaurant_ingredients` (`dish_tittle`, `ingredient`, `unit`, `weight`) VALUES
('Мексиканская', 'Томатный соус', 'грамм(ов)', 100),
('Мексиканская', 'Сладкий перец', 'грамм(ов)', 100),
('Мексиканская', 'Лук красный', 'грамм(ов)', 100),
('Мексиканская', 'Моцарелла', 'грамм(ов)', 100),
('Мексиканская', 'Острый перец халапеньо', 'грамм(ов)', 100),
('Мексиканская', 'Томаты', 'грамм(ов)', 100),
('Мексиканская', 'Соус сальса', 'грамм(ов)', 100),
('Сальса', 'Томатный соус', 'грамм(ов)', 100),
('Сальса', 'Острая чиризо', 'грамм(ов)', 100),
('Сальса', 'Шампиньоны', 'грамм(ов)', 100),
('Сальса', 'Моцарелла', 'грамм(ов)', 100),
('Сальса', 'Соус сальса', 'грамм(ов)', 100),
('Супермясная', 'Томатный соус', 'грамм(ов)', 100),
('Супермясная', 'Цыпленок', 'грамм(ов)', 100),
('Супермясная', 'Говядина (фарш)', 'грамм(ов)', 100),
('Супермясная', 'Пикантная пепперони', 'грамм(ов)', 100),
('Супермясная', 'Острая чоризо', 'грамм(ов)', 100),
('Супермясная', 'Моцарелла', 'грамм(ов)', 100),
('Супермясная', 'Бекон', 'грамм(ов)', 100),
('Мясная', 'Томатный соус', 'грамм(ов)', 100),
('Мясная', 'Цыпленок', 'грамм(ов)', 100),
('Мясная', 'Ветчина', 'грамм(ов)', 100),
('Мясная', 'Пикантная пепперони', 'грамм(ов)', 100),
('Мясная', 'Острая чоризо', 'грамм(ов)', 100),
('Мясная', 'Моцарелла', 'грамм(ов)', 100),
('Морская', 'Томатный соус', 'грамм(ов)', 100),
('Морская', 'Моцарелла', 'грамм(ов)', 100),
('Морская', 'Маслины', 'грамм(ов)', 100),
('Морская', 'Креветки', 'грамм(ов)', 100),
('Морская', 'Лук красный', 'грамм(ов)', 100),
('Морская', 'Сладкий перец', 'грамм(ов)', 100),
('Четыре сезона', 'Ветчина', 'грамм(ов)', 100),
('Четыре сезона', 'Пикантная пепперони', 'грамм(ов)', 100),
('Четыре сезона', 'Томатный соус', 'грамм(ов)', 100),
('Четыре сезона', 'Кубики брынзы', 'грамм(ов)', 100),
('Четыре сезона', 'Шампиньоны', 'грамм(ов)', 100),
('Четыре сезона', 'Моцарелла', 'грамм(ов)', 100),
('Четыре сезона', 'Томаты', 'грамм(ов)', 100),
('Четыре сезона', 'Орегано', 'грамм(ов)', 100),
('Чизбургер-пицца', 'Говядина (фарш)', 'грамм(ов)', 100),
('Чизбургер-пицца', 'Сырный соус', 'грамм(ов)', 100),
('Чизбургер-пицца', 'Бекон', 'грамм(ов)', 100),
('Чизбургер-пицца', 'Лук красный', 'грамм(ов)', 100),
('Чизбургер-пицца', 'Моцарелла', 'грамм(ов)', 100),
('Чизбургер-пицца', 'Томаты', 'грамм(ов)', 100),
('Чизбургер-пицца', 'Огурцы консервированные', 'грамм(ов)', 100),
('Цеплёнок барбекю', 'Цеплёнок', 'грамм(ов)', 100),
('Цеплёнок барбекю', 'Соус барбекю', 'грамм(ов)', 100),
('Цеплёнок барбекю', 'Томатный соус', 'грамм(ов)', 100),
('Цеплёнок барбекю', 'Лук красный', 'грамм(ов)', 100),
('Цеплёнок барбекю', 'Моцарелла', 'грамм(ов)', 100),
('Цеплёнок барбекю', 'Бекон', 'грамм(ов)', 100);

-- --------------------------------------------------------

--
-- Структура таблицы `restaurant_orders`
--

CREATE TABLE `restaurant_orders` (
  `order_id` varchar(36) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `restaurant_orders`
--

INSERT INTO `restaurant_orders` (`order_id`, `order_status`, `user_id`) VALUES
('5ee27ffaf082a', 'Доставляется', 'd0b97862-f8bd-11e8-b1e0-ac5043edbccf');

--
-- Триггеры `restaurant_orders`
--
DELIMITER $$
CREATE TRIGGER `drop_order` BEFORE DELETE ON `restaurant_orders` FOR EACH ROW BEGIN
	DELETE FROM `restaurant_cart` 
    WHERE `restaurant_cart`.order_id = OLD.order_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `restaurant_session`
--

CREATE TABLE `restaurant_session` (
  `session_id` varchar(36) NOT NULL,
  `session_date` datetime NOT NULL,
  `acc_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `restaurant_session`
--

INSERT INTO `restaurant_session` (`session_id`, `session_date`, `acc_id`) VALUES
('5ee27f77e936d', '2020-06-13 22:05:43', 'asfga34aee23');

-- --------------------------------------------------------

--
-- Структура таблицы `restaurant_users`
--

CREATE TABLE `restaurant_users` (
  `u_id` varchar(36) NOT NULL,
  `u_name` varchar(255) NOT NULL,
  `u_address` varchar(320) NOT NULL,
  `u_phone` varchar(255) NOT NULL,
  `u_role` varchar(255) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `restaurant_users`
--

INSERT INTO `restaurant_users` (`u_id`, `u_name`, `u_address`, `u_phone`, `u_role`) VALUES
('d0b97862-f8bd-11e8-b1e0-ac5043edbccf', 'Василий Пупкин', 'ул. Строителей, д.5', '8-800-555-35-35', 'admin'),
('d0b981bc-f8bd-11e8-b1e0-ac5043edbccf', 'Аркадий Достоевский', 'ул. Комсомольская, д.24', '8-800-800-26-20', 'user');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `restaurant_accounts`
--
ALTER TABLE `restaurant_accounts`
  ADD PRIMARY KEY (`acc_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Индексы таблицы `restaurant_availability`
--
ALTER TABLE `restaurant_availability`
  ADD UNIQUE KEY `acc_id` (`acc_id`);

--
-- Индексы таблицы `restaurant_cart`
--
ALTER TABLE `restaurant_cart`
  ADD KEY `dish_tittle` (`dish_tittle`),
  ADD KEY `acc_id` (`acc_id`) USING BTREE,
  ADD KEY `order_id` (`order_id`) USING BTREE;

--
-- Индексы таблицы `restaurant_dish`
--
ALTER TABLE `restaurant_dish`
  ADD PRIMARY KEY (`dish_tittle`) USING BTREE;

--
-- Индексы таблицы `restaurant_ingredients`
--
ALTER TABLE `restaurant_ingredients`
  ADD KEY `dish_tittle` (`dish_tittle`);

--
-- Индексы таблицы `restaurant_orders`
--
ALTER TABLE `restaurant_orders`
  ADD UNIQUE KEY `order_id` (`order_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `restaurant_session`
--
ALTER TABLE `restaurant_session`
  ADD PRIMARY KEY (`session_id`),
  ADD UNIQUE KEY `acc_id` (`acc_id`);

--
-- Индексы таблицы `restaurant_users`
--
ALTER TABLE `restaurant_users`
  ADD PRIMARY KEY (`u_id`),
  ADD KEY `ind_name_address` (`u_name`(100),`u_address`(100));

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `restaurant_accounts`
--
ALTER TABLE `restaurant_accounts`
  ADD CONSTRAINT `restaurant_accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `restaurant_users` (`u_id`);

--
-- Ограничения внешнего ключа таблицы `restaurant_availability`
--
ALTER TABLE `restaurant_availability`
  ADD CONSTRAINT `restaurant_availability_ibfk_1` FOREIGN KEY (`acc_id`) REFERENCES `restaurant_accounts` (`acc_id`);

--
-- Ограничения внешнего ключа таблицы `restaurant_cart`
--
ALTER TABLE `restaurant_cart`
  ADD CONSTRAINT `restaurant_cart_ibfk_1` FOREIGN KEY (`dish_tittle`) REFERENCES `restaurant_dish` (`dish_tittle`),
  ADD CONSTRAINT `restaurant_cart_ibfk_2` FOREIGN KEY (`acc_id`) REFERENCES `restaurant_accounts` (`acc_id`);

--
-- Ограничения внешнего ключа таблицы `restaurant_ingredients`
--
ALTER TABLE `restaurant_ingredients`
  ADD CONSTRAINT `restaurant_ingredients_ibfk_1` FOREIGN KEY (`dish_tittle`) REFERENCES `restaurant_dish` (`dish_tittle`);

--
-- Ограничения внешнего ключа таблицы `restaurant_orders`
--
ALTER TABLE `restaurant_orders`
  ADD CONSTRAINT `restaurant_orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `restaurant_users` (`u_id`),
  ADD CONSTRAINT `restaurant_orders_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `restaurant_cart` (`order_id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `restaurant_session`
--
ALTER TABLE `restaurant_session`
  ADD CONSTRAINT `restaurant_session_ibfk_1` FOREIGN KEY (`acc_id`) REFERENCES `restaurant_accounts` (`acc_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
