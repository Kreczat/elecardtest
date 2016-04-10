--
-- ������ ������������ Devart dbForge Studio for MySQL, ������ 6.3.358.0
-- �������� �������� ��������: http://www.devart.com/ru/dbforge/mysql/studio
-- ���� �������: 10.04.2016 21:02:31
-- ������ �������: 5.7.7-rc-log
-- ������ �������: 4.1
--


--
-- �������� ��� ���� ������ testdb
--
DROP DATABASE IF EXISTS testdb;
CREATE DATABASE IF NOT EXISTS testdb
	CHARACTER SET utf8
	COLLATE utf8_general_ci;

-- 
-- ���������� ������� ������
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- ���������� ����� SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- ��������� ���� ������ �� ���������
--
USE testdb;

--
-- �������� ��� ������� product
--
CREATE TABLE IF NOT EXISTS product (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 6
AVG_ROW_LENGTH = 4096
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- �������� ��� ������� users
--
CREATE TABLE IF NOT EXISTS users (
  id INT(11) NOT NULL AUTO_INCREMENT,
  full_name VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- �������� ��� ������� purchase
--
CREATE TABLE IF NOT EXISTS purchase (
  id INT(11) NOT NULL AUTO_INCREMENT,
  user_id INT(11) NOT NULL,
  product_id INT(11) NOT NULL,
  purchase_time DATETIME NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_purchase_product_id FOREIGN KEY (product_id)
    REFERENCES product(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_purchase_users_id FOREIGN KEY (user_id)
    REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- �������� ��� ������������� view_all
--
CREATE OR REPLACE 
	DEFINER = 'root'@'localhost'
VIEW view_all
AS
	select `users`.`full_name` AS `user_name`,`product`.`name` AS `product_name`,`purchase`.`purchase_time` AS `purchase_time` from ((`purchase` join `users` on((`purchase`.`user_id` = `users`.`id`))) join `product` on((`purchase`.`product_id` = `product`.`id`)));

--
-- �������� ��� ������������� view_today
--
CREATE OR REPLACE 
	DEFINER = 'root'@'localhost'
VIEW view_today
AS
	select `users`.`full_name` AS `user_name`,`product`.`name` AS `product_name`,`purchase`.`purchase_time` AS `purchase_time` from ((`purchase` join `users` on((`purchase`.`user_id` = `users`.`id`))) join `product` on((`purchase`.`product_id` = `product`.`id`))) where (cast(`purchase`.`purchase_time` as date) = cast(now() as date));

--
-- �������� ��� ������������� view1
--
CREATE OR REPLACE 
	DEFINER = 'root'@'localhost'
VIEW view1
AS
	select distinct `users`.`full_name` AS `full_name` from (`purchase` join `users` on((`purchase`.`user_id` = `users`.`id`)));

-- 
-- ����� ������ ��� ������� product
--
INSERT INTO product(id, name) VALUES
(1, 'apple'),
(2, 'banana'),
(3, 'pear'),
(4, 'peach'),
(5, 'coconut');

-- 
-- ����� ������ ��� ������� users
--
INSERT INTO users(id, full_name) VALUES
(1, 'ivanov'),
(2, 'petrov'),
(3, 'sidorov');

-- 
-- ����� ������ ��� ������� purchase
--
INSERT INTO purchase(id, user_id, product_id, purchase_time) VALUES
(1, 1, 2, '2016-04-06 20:19:01'),
(2, 2, 5, '2016-04-08 20:19:15'),
(3, 3, 2, '2016-04-08 21:19:38');

-- 
-- ������������ ���������� ����� SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- ��������� ������� ������
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;