-- CREATE DATABASE AND USE IT
DROP DATABASE IF EXISTS `alx_book_store`;
CREATE DATABASE `alx_book_store`;
USE `alx_book_store`;

-- AUTHORS
CREATE TABLE `Authors` (
  `author_id` INT NOT NULL AUTO_INCREMENT,
  `author_name` VARCHAR(215) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

-- CUSTOMERS
CREATE TABLE `Customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(215) NOT NULL,
  `email` VARCHAR(215) NOT NULL,
  `address` TEXT,
  PRIMARY KEY (`customer_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

-- BOOKS
CREATE TABLE `Books` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(130) NOT NULL,
  `author_id` INT NOT NULL,
  `price` DOUBLE NOT NULL,
  `publication_date` DATE,
  PRIMARY KEY (`book_id`),
  INDEX `idx_books_author_id` (`author_id`),
  CONSTRAINT `fk_books_author`
    FOREIGN KEY (`author_id`) REFERENCES `Authors`(`author_id`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

-- ORDERS
CREATE TABLE `Orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `order_date` DATE NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `idx_orders_customer_id` (`customer_id`),
  CONSTRAINT `fk_orders_customer`
    FOREIGN KEY (`customer_id`) REFERENCES `Customers`(`customer_id`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

-- ORDER_DETAILS
CREATE TABLE `Order_Details` (
  `orderdetailid` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  `quantity` DOUBLE NOT NULL,
  PRIMARY KEY (`orderdetailid`),
  INDEX `idx_order_details_order_id` (`order_id`),
  INDEX `idx_order_details_book_id` (`book_id`),
  CONSTRAINT `fk_order_details_order`
    FOREIGN KEY (`order_id`) REFERENCES `Orders`(`order_id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT `fk_order_details_book`
    FOREIGN KEY (`book_id`) REFERENCES `Books`(`book_id`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;
