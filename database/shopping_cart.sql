-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2021 at 04:52 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping_cart`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` char(36) NOT NULL,
  `title` varchar(66) NOT NULL,
  `meta_title` varchar(666) DEFAULT NULL,
  `meta_description` varchar(666) DEFAULT NULL,
  `slug` varchar(66) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `title`, `meta_title`, `meta_description`, `slug`, `content`, `created_at`, `updated_at`) VALUES
('2eb85fa4-90fd-45cb-9282-d24c9c97868c', 'Innisfree', 'Innisfree', 'Innisfree', 'innisfree', 'innisfree', '2020-11-26 06:59:37', '2020-11-26 06:59:37'),
('8d48a745-7f54-4f7f-9642-1ee8340eb5b5', 'Neutrogena', 'Neutrogena', 'Neutrogena', 'neutrogena', 'neutrogena', '2020-11-26 06:59:37', '2020-11-26 06:59:37'),
('d653f0a2-07fc-4635-8122-39ef8f68adc3', 'Maybelline', 'Maybelline', 'Maybelline', 'maybelline', 'maybelline', '2020-11-26 06:59:37', '2020-11-26 06:59:37');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
('83da113b-9d10-404d-859f-cec7db10eede', '0867b15d-dcce-4b10-a82c-5b4d3a1b4744', '2021-01-01 11:36:34', '2021-01-01 11:36:34'),
('c11cd2af-a7a4-445a-acb2-067844e0a89e', 'efaf21d2-8e5a-4ef5-8992-22644db8576b', '2020-11-27 15:53:57', '2020-11-27 15:53:57');

-- --------------------------------------------------------

--
-- Table structure for table `cart_product`
--

CREATE TABLE `cart_product` (
  `id` char(36) NOT NULL,
  `cart_id` char(36) NOT NULL,
  `product_id` char(36) NOT NULL,
  `quantity` int(6) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart_product`
--

INSERT INTO `cart_product` (`id`, `cart_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
('0fad9dd8-b894-4abb-97d7-455b77c06c32', 'c11cd2af-a7a4-445a-acb2-067844e0a89e', '74f192d9-9645-48fa-b856-11123c255dc4', 17, '2021-01-05 04:50:57', '2021-05-14 02:50:52'),
('36e2daf0-ffc3-4233-9a89-891555dba261', 'c11cd2af-a7a4-445a-acb2-067844e0a89e', '19037737-1c4c-453e-8e60-6ecf7ab48e52', 4, '2021-01-05 12:30:57', '2021-05-14 02:51:22'),
('388acdf5-4ef0-486b-9be2-dceaa73d0682', 'c11cd2af-a7a4-445a-acb2-067844e0a89e', '5cb4e18b-3391-42b2-a5c9-9fb1efe85f91', 1, '2021-01-05 07:23:52', '2021-01-05 07:23:52'),
('86622b80-7d13-42bb-b339-de100672e8bb', 'c11cd2af-a7a4-445a-acb2-067844e0a89e', '50ef080f-6115-4bfb-9c29-6fb68096a6a9', 1, '2021-05-14 02:51:38', '2021-05-14 02:51:38');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `title` varchar(66) NOT NULL,
  `meta_title` varchar(666) DEFAULT NULL,
  `meta_description` varchar(666) DEFAULT NULL,
  `slug` varchar(66) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `parent_id`, `title`, `meta_title`, `meta_description`, `slug`, `content`, `created_at`, `updated_at`) VALUES
('113ba666-9c09-405d-a861-39tt3a03cd59', NULL, 'Nước hoa nữ', 'Nước hoa nữ', 'Nước hoa nữ', 'nuoc-hoa-nu', 'Nước hoa nữ', '2020-11-26 06:57:49', '2020-11-26 06:57:49'),
('23d5f440-9016-4589-8509-ac3ea5db7d60', NULL, 'Làm sạch da', 'Làm sạch da', 'Làm sạch da', 'lam-sach-da', 'Làm sạch da', '2021-01-05 03:16:23', '2021-01-05 03:16:23'),
('28b592c5-b2d4-4ac6-8f21-ef48db246dae', NULL, 'Dưỡng da', 'Dưỡng da', 'Dưỡng da', 'duong-da', 'Dưỡng da', '2020-11-26 06:57:49', '2020-11-26 06:57:49'),
('a6a8c759-c8fa-41c4-91f0-fb9ce4bb2b5c', NULL, 'Trang điểm', 'Trang điểm', 'Trang điểm', 'trang-diem', 'Trang điểm', '2021-01-05 03:17:46', '2021-01-05 03:17:46'),
('ae81347f-35bf-4e93-9273-f7a1692bb6eb', NULL, 'Dụng cụ trang điểm', 'Dụng cụ trang điểm', 'Dụng cụ trang điểm', 'dung-cu-trang-diem', 'Dụng cụ trang điểm', '2021-01-05 03:16:23', '2021-01-05 03:16:23');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` char(36) NOT NULL,
  `product_id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `content` text NOT NULL,
  `rating` smallint(1) NOT NULL DEFAULT 0,
  `published` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` char(36) NOT NULL,
  `user_id` char(36) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `sub_total` decimal(18,0) NOT NULL DEFAULT 0 CHECK (`sub_total` >= 0),
  `shipping` decimal(18,0) NOT NULL DEFAULT 0 CHECK (`shipping` >= 0),
  `promo` varchar(50) DEFAULT NULL,
  `discount` decimal(18,0) NOT NULL DEFAULT 0 CHECK (`discount` >= 0),
  `total` decimal(18,0) NOT NULL DEFAULT 0 CHECK (`total` >= 0),
  `first_name` varchar(66) NOT NULL,
  `last_name` varchar(66) NOT NULL,
  `email` varchar(66) NOT NULL,
  `phone_number` varchar(66) DEFAULT NULL,
  `address` varchar(666) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `status`, `sub_total`, `shipping`, `promo`, `discount`, `total`, `first_name`, `last_name`, `email`, `phone_number`, `address`, `created_at`, `updated_at`) VALUES
('34146073-b1cc-4e45-a4e6-b2b9185687ec', 'efaf21d2-8e5a-4ef5-8992-22644db8576b', 0, '5000000', '100000', NULL, '500000', '4600000', '234234', '324324', 'nhtanonymous@gmail.com', '84324234234', 'TPHCM324', '2021-01-02 04:32:37', '2021-01-02 04:32:37'),
('5a755017-937f-4d6d-b801-6931bab99a5b', 'efaf21d2-8e5a-4ef5-8992-22644db8576b', 0, '55000000', '60000', NULL, '8000000', '47000000', '32423', '4234', 'nhtanonymous@gmail.com', '84324234234', 'TPHCM234', '2021-01-02 04:01:51', '2021-01-02 04:01:51'),
('663014bd-1364-459c-bf79-ab6f5783f438', 'efaf21d2-8e5a-4ef5-8992-22644db8576b', 0, '10000000', '60000', NULL, '1000000', '9000000', 'Vy', 'sad', 'nhtanonymous@gmail.com', '840225622626626', 'TPHCMMMM', '2021-01-02 04:04:11', '2021-01-02 04:04:11'),
('6c352607-0677-458a-9d0c-e0803090be67', 'efaf21d2-8e5a-4ef5-8992-22644db8576b', 0, '11000000', '60000', NULL, '1500000', '9560000', '213414', '324234', 'd4z@d4z.com', '84435435435', '3454353', '2021-01-02 07:28:20', '2021-01-02 07:28:20'),
('76f58ee7-9abf-466d-9cc2-60048654378a', 'efaf21d2-8e5a-4ef5-8992-22644db8576b', 0, '55000000', '100000', NULL, '8000000', '47000000', 'Vy', 'Nguyen', 'nhtanonymous@gmail.com', '843244444444444', '324234234eger', '2021-01-02 04:03:17', '2021-01-02 04:03:17'),
('c08e2ed1-3d9c-4bc6-ac4f-517b29f14c80', 'efaf21d2-8e5a-4ef5-8992-22644db8576b', 0, '55000000', '60000', NULL, '8000000', '47000000', '32423', '4234', 'nhtanonymous@gmail.com', '84324234234', 'TPHCM234', '2021-01-02 03:59:19', '2021-01-02 03:59:19'),
('cd6bcea3-4a59-4fba-94cb-6b15572b647b', 'efaf21d2-8e5a-4ef5-8992-22644db8576b', 0, '55000000', '100000', NULL, '8000000', '47000000', 'Vy', 'Nguyen', 'nhtanonymous@gmail.com', '843545345345354', 'TPHCMmm', '2021-01-02 03:58:37', '2021-01-02 03:58:37'),
('ec221b37-3b67-49f4-b04d-8ef19f5674db', 'efaf21d2-8e5a-4ef5-8992-22644db8576b', 0, '55000000', '60000', NULL, '8000000', '47000000', '32423', '4234', 'nhtanonymous@gmail.com', '84324234234', 'TPHCM234', '2021-01-02 04:01:33', '2021-01-02 04:01:33'),
('f3a65398-a3ef-4480-ae6e-533ff2977739', 'efaf21d2-8e5a-4ef5-8992-22644db8576b', 0, '5000000', '100000', NULL, '500000', '4600000', 'ewrwe', 'rwerwr', 'nhtanonymous@gmail.com', '8432423423', 'ewrwerwer', '2021-01-02 07:26:10', '2021-01-02 07:26:10');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` char(36) NOT NULL,
  `product_id` char(36) NOT NULL,
  `order_id` char(36) NOT NULL,
  `price` decimal(18,0) NOT NULL DEFAULT 0 CHECK (`price` >= 0),
  `discount` decimal(18,0) NOT NULL DEFAULT 0 CHECK (`discount` >= 0),
  `total` decimal(18,0) NOT NULL DEFAULT 0,
  `quantity` int(6) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `product_id`, `order_id`, `price`, `discount`, `total`, `quantity`, `created_at`, `updated_at`) VALUES
('092893c0-4e2e-4dcb-bda1-c32fb9d1cefe', '74f192d9-gg45-48fa-b856-11123c255dc4', '34146073-b1cc-4e45-a4e6-b2b9185687ec', '5000000', '500000', '4500000', 1, '2021-01-02 04:32:37', '2021-01-02 04:32:37'),
('35aec34c-ee8e-4a3b-b476-9b9889e31e59', '74f192d9-gg45-48fa-b856-11123c255dc4', '76f58ee7-9abf-466d-9cc2-60048654378a', '20000000', '2000000', '18000000', 4, '2021-01-02 04:03:17', '2021-01-02 04:03:17'),
('388926ca-34f7-4f90-8807-83b469f5b72c', '74f192d9-gg45-48fa-b856-11123c255dc4', '6c352607-0677-458a-9d0c-e0803090be67', '5000000', '500000', '4500000', 1, '2021-01-02 07:28:20', '2021-01-02 07:28:20'),
('73232d7b-82a9-415f-be14-cbbab32a6820', '74f192d9-gg45-48fa-b856-11123c255dc4', 'f3a65398-a3ef-4480-ae6e-533ff2977739', '5000000', '500000', '4500000', 1, '2021-01-02 07:26:10', '2021-01-02 07:26:10'),
('745926a6-0a7f-4f88-b207-da58e2a4851e', 'bd388b69-83fe-4d4b-a1bf-3473dfe7522b', '6c352607-0677-458a-9d0c-e0803090be67', '6000000', '1000000', '5000000', 1, '2021-01-02 07:28:20', '2021-01-02 07:28:20'),
('a404acd9-f0a6-458b-a37d-e9c1d8e42e98', '74f192d9-gg45-48fa-b856-11123c255dc4', '663014bd-1364-459c-bf79-ab6f5783f438', '5000000', '500000', '4500000', 1, '2021-01-02 04:04:11', '2021-01-02 04:04:11'),
('a8402cfa-97f9-4f42-ab2c-625359d95f38', '74f192d9-9645-48fa-b856-11123c255dc4', '663014bd-1364-459c-bf79-ab6f5783f438', '5000000', '500000', '4500000', 1, '2021-01-02 04:04:11', '2021-01-02 04:04:11'),
('b4a69a29-1884-4b8f-b9f4-53505e4a8cdb', '50ef080f-6115-4bfb-9c29-6fb68096a6a9', '76f58ee7-9abf-466d-9cc2-60048654378a', '25000000', '5000000', '20000000', 5, '2021-01-02 04:03:17', '2021-01-02 04:03:17'),
('d9262f7c-e3fe-401c-99c6-e3d06fe94a9e', '74f192d9-9645-48fa-b856-11123c255dc4', '76f58ee7-9abf-466d-9cc2-60048654378a', '10000000', '1000000', '9000000', 2, '2021-01-02 04:03:17', '2021-01-02 04:03:17');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` char(36) NOT NULL,
  `category_id` char(36) NOT NULL,
  `brand_id` char(36) NOT NULL,
  `title` varchar(666) NOT NULL,
  `meta_title` varchar(666) DEFAULT NULL,
  `meta_description` varchar(666) DEFAULT NULL,
  `slug` varchar(166) NOT NULL,
  `excerpt` varchar(666) DEFAULT NULL,
  `content` text NOT NULL,
  `price` decimal(18,0) NOT NULL DEFAULT 0 CHECK (`price` >= 0),
  `discount` decimal(18,0) NOT NULL DEFAULT 0 CHECK (`discount` >= 0),
  `quantity` smallint(6) UNSIGNED NOT NULL DEFAULT 0,
  `published` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category_id`, `brand_id`, `title`, `meta_title`, `meta_description`, `slug`, `excerpt`, `content`, `price`, `discount`, `quantity`, `published`, `published_at`, `created_at`, `updated_at`) VALUES
('0e5414f6-4e31-4f8a-aa9b-993b972f2cb2', 'a6a8c759-c8fa-41c4-91f0-fb9ce4bb2b5c', 'd653f0a2-07fc-4635-8122-39ef8f68adc3', 'Má Hồng Odbo Happy Everyday Pocket Blusher', 'Má Hồng Odbo Happy Everyday Pocket Blusher', 'Má Hồng Odbo Happy Everyday Pocket Blusher', 'ma-hong-odbo-happy-everyday-pocket-blusher-od103', 'Má Hồng Odbo Happy Everyday Pocket Blusher', 'Má Hồng Odbo Happy Everyday Pocket Blusher', '500000', '100000', 84, 1, NULL, '2020-11-25 22:13:48', '2020-11-25 22:13:48'),
('19037737-1c4c-453e-8e60-6ecf7ab48e52', 'a6a8c759-c8fa-41c4-91f0-fb9ce4bb2b5c', '8d48a745-7f54-4f7f-9642-1ee8340eb5b5', 'Son Thỏi Lì Peripera Ink Tattoo Stick', 'Son Thỏi Lì Peripera Ink Tattoo Stick', 'Son Thỏi Lì Peripera Ink Tattoo Stick', 'son-thoi-li-peripera-ink-tattoo-stick-32gr', 'Son Thỏi Lì Peripera Ink Tattoo Stick', 'Son Thỏi Lì Peripera Ink Tattoo Stick', '450000', '100000', 478, 1, NULL, '2020-11-25 22:13:48', '2020-11-25 22:13:48'),
('50ef080f-6115-4bfb-9c29-6fb68096a6a9', 'ae81347f-35bf-4e93-9273-f7a1692bb6eb', '2eb85fa4-90fd-45cb-9282-d24c9c97868c', 'Bông Phấn Phủ Vacosi Small Round Puff - BP01', 'Bông Phấn Phủ Vacosi Small Round Puff - BP01', 'Bông Phấn Phủ Vacosi Small Round Puff - BP01', 'bong-phan-phu-kho-tron-nho-vacosi-small-round-puff-bp01', 'Bông Phấn Phủ Vacosi Small Round Puff - BP01', 'Bông Phấn Phủ Vacosi Small Round Puff - BP01', '300000', '0', 666, 1, '2020-11-24 22:34:12', '2020-11-24 08:35:03', '2021-01-05 04:23:56'),
('5cb4e18b-3391-42b2-a5c9-9fb1efe85f91', '23d5f440-9016-4589-8509-ac3ea5db7d60', 'd653f0a2-07fc-4635-8122-39ef8f68adc3', 'Tẩy Da Chết Mặt Cocoon Coffee Face Polish 150ml', 'Tẩy Da Chết Mặt Cocoon Coffee Face Polish 150ml', 'Tẩy Da Chết Mặt Cocoon Coffee Face Polish 150ml', 'tay-da-chet-mat-ca-phe-dak-lak-cocoon-coffee-face-polish-150ml', 'Tẩy Da Chết Mặt Cocoon Coffee Face Polish 150ml', 'Tẩy Da Chết Mặt Cocoon Coffee Face Polish 150ml', '220000', '50000', 333, 1, NULL, '2020-11-25 22:13:48', '2020-11-25 22:13:48'),
('74f192d9-9645-48fa-b856-11123c255dc4', '113ba666-9c09-405d-a861-39tt3a03cd59', 'd653f0a2-07fc-4635-8122-39ef8f68adc3', 'Nước Hoa Nữ Venus Global Beauty Laura Anné', 'Nước Hoa Nữ Venus Global Beauty Laura Anné', 'Nước Hoa Nữ Venus Global Beauty Laura Anné', 'nuoc-hoa-nu-venus-global-beauty-laura-anne-perfume-50ml', 'Nước Hoa Nữ Venus Global Beauty Laura Anné', 'Nước Hoa Nữ Venus Global Beauty Laura Anné', '1500000', '0', 684, 1, NULL, '2020-11-25 22:06:05', '2021-01-05 04:24:44'),
('74f192d9-gg45-48fa-b856-11123c255dc4', '113ba666-9c09-405d-a861-39tt3a03cd59', 'd653f0a2-07fc-4635-8122-39ef8f68adc3', 'Nước Hoa Nữ Venus Global Beauty Laura Anné', 'Nước Hoa Nữ Venus Global Beauty Laura Anné', 'Nước Hoa Nữ Venus Global Beauty Laura Anné', 'nuoc-hoa-nu-venus-global-beauty-laura-anne-eau-de-parfum-50ml-dynamic', 'Nước Hoa Nữ Venus Global Beauty Laura Anné', 'Nước Hoa Nữ Venus Global Beauty Laura Anné', '2000000', '500000', 684, 1, NULL, '2020-11-25 22:13:48', '2021-01-05 04:05:09'),
('bd388b69-83fe-4d4b-a1bf-3473dfe7522b', '113ba666-9c09-405d-a861-39tt3a03cd59', 'd653f0a2-07fc-4635-8122-39ef8f68adc3', 'Nước Hoa Venus Global Beauty Laura Anné DIAMOND', 'Nước Hoa Venus Global Beauty Laura Anné DIAMOND', 'Nước Hoa Venus Global Beauty Laura Anné DIAMOND', 'nuoc-hoa-venus-global-beauty-laura-anne-diamond-perfume-45ml', 'Nước Hoa Venus Global Beauty Laura Anné DIAMOND', 'Nước Hoa Venus Global Beauty Laura Anné DIAMOND', '2600000', '0', 684, 1, NULL, '2020-11-25 22:13:48', '2021-01-05 04:05:31'),
('cff51dc0-aeb0-4212-81d7-f847cb07f810', '23d5f440-9016-4589-8509-ac3ea5db7d60', 'd653f0a2-07fc-4635-8122-39ef8f68adc3', 'Gel Rửa Mặt Hoa Hồng Cocoon Rose Cleanser', 'Gel Rửa Mặt Hoa Hồng Cocoon Rose Cleanser', 'Gel Rửa Mặt Hoa Hồng Cocoon Rose Cleanser', 'gel-rua-mat-hoa-hong-cocoon-rose-cleanser-140ml', 'Gel Rửa Mặt Hoa Hồng Cocoon Rose Cleanser', 'Gel Rửa Mặt Hoa Hồng Cocoon Rose Cleanser', '350000', '100000', 222, 1, NULL, '2020-11-25 22:13:48', '2020-11-25 22:13:48'),
('d0879fa2-d3e5-4de9-a146-f4eb0e9007fd', '23d5f440-9016-4589-8509-ac3ea5db7d60', '8d48a745-7f54-4f7f-9642-1ee8340eb5b5', 'Tẩy Da Chết Neutrogena Bright Boost', 'Tẩy Da Chết Neutrogena Bright Boost', 'Tẩy Da Chết Neutrogena Bright Boost', 'kem-tay-da-chet-neutrogena-bright-boost-resurfacing-micro-polish-75ml', 'Tẩy Da Chết Neutrogena Bright Boost', 'Tẩy Da Chết Neutrogena Bright Boost', '200000', '0', 451, 1, NULL, '2020-11-25 22:13:48', '2020-11-25 22:13:48'),
('e5091d8a-24f9-4d7f-a123-732c4c3e9e7c', '23d5f440-9016-4589-8509-ac3ea5db7d60', '8d48a745-7f54-4f7f-9642-1ee8340eb5b5', 'Sữa Rửa Mặt Cosrx Calming Foam Cleanser 150ml', 'Sữa Rửa Mặt Cosrx Calming Foam Cleanser 150ml', 'Sữa Rửa Mặt Cosrx Calming Foam Cleanser 150ml', 'sua-rua-mat-cosrx-calming-foam-cleanser-150ml', 'Sữa Rửa Mặt Cosrx Calming Foam Cleanser 150ml', 'Sữa Rửa Mặt Cosrx Calming Foam Cleanser 150ml', '100000', '0', 122, 1, NULL, '2020-11-25 22:13:48', '2020-11-25 22:13:48');

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `id` char(36) NOT NULL,
  `product_id` char(36) NOT NULL,
  `title` varchar(666) NOT NULL,
  `url` varchar(666) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`id`, `product_id`, `title`, `url`, `created_at`, `updated_at`) VALUES
('1046562b-1298-4382-8ec6-f06e300d3bf1', '19037737-1c4c-453e-8e60-6ecf7ab48e52', 'Ink-tattoo.jpg', '/images/products/Ink-tattoo.jpg', '2021-01-05 04:22:45', '2021-01-05 04:22:45'),
('4a468f73-a8ee-4f9e-b293-827e7a3a0e90', '0e5414f6-4e31-4f8a-aa9b-993b972f2cb2', 'Happy Everyday Pocket Blusher.png', '/images/products/Happy Everyday Pocket Blusher.png', '2021-01-05 04:14:24', '2021-01-05 04:14:24'),
('582611cf-4634-4668-ac0f-19af38e8d017', '74f192d9-gg45-48fa-b856-11123c255dc4', 'dynamic-04122019094735.jpg', '/images/products/dynamic-04122019094735.jpg', '2021-01-05 04:22:46', '2021-01-05 04:22:46'),
('67e3a9d3-d9ce-4e92-b422-023f2fb75733', 'bd388b69-83fe-4d4b-a1bf-3473dfe7522b', 'diamond-22112019020140.jpg', '/images/products/diamond-22112019020140.jpg', '2021-01-05 04:22:46', '2021-01-05 04:22:46'),
('6d499006-40ff-4b0b-a4a3-abca61b6ecd7', 'd0879fa2-d3e5-4de9-a146-f4eb0e9007fd', 'Kem-tẩy-da-chết-Neutrogena-Bright-Boost.jpg', '/images/products/Kem-tẩy-da-chết-Neutrogena-Bright-Boost.jpg', '2021-01-05 04:22:46', '2021-01-05 04:22:46'),
('84da76ee-39cc-42c8-8774-b23c13784f12', 'e5091d8a-24f9-4d7f-a123-732c4c3e9e7c', 'ava 6.jpg', '/images/products/ava 6.jpg', '2021-01-05 04:22:46', '2021-01-05 04:22:46'),
('abedce2b-5350-4b91-bab3-f784e6089fc1', '5cb4e18b-3391-42b2-a5c9-9fb1efe85f91', 'Avatar-SP-Web(1)(1.jpg', '/images/products/Avatar-SP-Web(1)(1.jpg', '2021-01-05 04:22:45', '2021-01-05 04:22:45'),
('b015f902-5963-4b84-a9e0-be4ae4f47d32', '74f192d9-9645-48fa-b856-11123c255dc4', 'very-sexy-night-recovered-recovered-recovered-22112019111005.jpg', '/images/products/very-sexy-night-recovered-recovered-recovered-22112019111005.jpg', '2021-01-05 04:22:46', '2021-01-05 04:22:46'),
('d085bedb-1a09-4ec4-a698-5ed8d0ea3f35', 'cff51dc0-aeb0-4212-81d7-f847cb07f810', 'srm-cocoon.jpg', '/images/products/srm-cocoon.jpg', '2021-01-05 04:22:46', '2021-01-05 04:22:46'),
('ee217761-c4c3-4dc3-aa27-b4eb36c8ea22', '50ef080f-6115-4bfb-9c29-6fb68096a6a9', 'Bp01.jpg', '/images/products/Bp01.jpg', '2021-01-05 04:22:45', '2021-01-05 04:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `product_id` char(36) NOT NULL,
  `tag_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_tag`
--

INSERT INTO `product_tag` (`product_id`, `tag_id`, `created_at`, `updated_at`) VALUES
('50ef080f-6115-4bfb-9c29-6fb68096a6a9', 'ef39c75b-6b2b-48e3-a96e-4b96f081abe4', '2020-11-26 07:26:50', '2020-11-26 07:26:50');

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` char(36) NOT NULL,
  `title` varchar(66) NOT NULL,
  `image` varchar(666) NOT NULL,
  `content` varchar(666) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` char(36) NOT NULL,
  `title` varchar(666) NOT NULL,
  `meta_title` varchar(666) DEFAULT NULL,
  `meta_description` varchar(666) DEFAULT NULL,
  `slug` varchar(66) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `title`, `meta_title`, `meta_description`, `slug`, `content`, `created_at`, `updated_at`) VALUES
('ef39c75b-6b2b-48e3-a96e-4b96f081abe4', 'Trang điểm', 'Trang điểm', 'Trang điểm', 'trang-diem', 'Trang điểm', '2020-11-26 07:26:15', '2020-11-26 07:26:15');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` char(36) NOT NULL,
  `first_name` varchar(66) NOT NULL,
  `last_name` varchar(66) NOT NULL,
  `user_name` varchar(66) NOT NULL,
  `email` varchar(66) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(666) NOT NULL,
  `remember_token` varchar(666) DEFAULT NULL,
  `auth_token` varchar(6666) DEFAULT NULL,
  `phone_number` varchar(66) DEFAULT NULL,
  `address` varchar(666) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `avatar` varchar(666) DEFAULT NULL,
  `intro` tinytext DEFAULT NULL,
  `profile` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `user_name`, `email`, `email_verified_at`, `password`, `remember_token`, `auth_token`, `phone_number`, `address`, `gender`, `avatar`, `intro`, `profile`, `created_at`, `updated_at`) VALUES
('0867b15d-dcce-4b10-a82c-5b4d3a1b4744', 'sadasd', 'sadsad', 'sadasdydthwsad', 'vyvydthwsad@dsad.cp', NULL, '$2y$10$vOEHEcF.hLjNHnTm8q7WAOIQZ5u5thqV.DP0JzHClFnQLwC/GAl4C', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9uZ3V5ZW50aHVjb2ZmaWNpYWwub3JnXC9zaG9wcGluZy1jYXJ0LWxhcmF2ZWwtYXBpXC9wdWJsaWNcL2FwaVwvdXNlcnNcL2xvZ2luIiwiaWF0IjoxNjA5NTAwOTg2LCJleHAiOjE2MDk1MDQ1ODYsIm5iZiI6MTYwOTUwMDk4NiwianRpIjoiak1SRUVTNmx6NnQ0TWlEbSIsInN1YiI6IjA4NjdiMTVkLWRjY2UtNGIxMC1hODJjLTViNGQzYTFiNDc0NCIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjciLCJpZCI6IjA4NjdiMTVkLWRjY2UtNGIxMC1hODJjLTViNGQzYTFiNDc0NCIsInVzZXJfbmFtZSI6InNhZGFzZHlkdGh3c2FkIiwiZW1haWwiOiJ2eXZ5ZHRod3NhZEBkc2FkLmNwIiwiYXZhdGFyIjpudWxsfQ.JWKh4HQRVPoU3sMJTTyqF1dmz7TIzAfUz-Qfcv5bTrk', NULL, NULL, 'female', NULL, NULL, NULL, '2021-01-01 11:36:01', '2021-01-01 11:36:26'),
('2ec2ca56-37b5-44da-8d4b-e346515fcd8f', 'awdawd', 'awdawd', 'vyvydthwsadsadad', 'awd@asda.com', NULL, '$2y$10$hdkr8TnO/HpEMkQZdpwadOyCX8hGZBG7jxtPI5hMhoOo/0bAjncIi', NULL, NULL, NULL, NULL, 'male', NULL, NULL, NULL, '2021-01-01 11:18:26', '2021-01-01 11:18:26'),
('457c7415-b693-4b71-b2c9-3eb84005c730', 'Vy', 'Nguyen', 'vyvydthw', 'nhtanonymous666@gmail.com', NULL, '$2y$10$uHhhChEw9/fQ/5VQN4PKw.05F/Pl.HcSEIQHApjxRP4Ywhb1a9uoe', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9uZ3V5ZW50aHVjb2ZmaWNpYWwub3JnXC9zaG9wcGluZy1jYXJ0LWxhcmF2ZWwtYXBpXC9wdWJsaWNcL2FwaVwvdXNlcnNcL2xvZ2luIiwiaWF0IjoxNjA5NTAwOTA5LCJleHAiOjE2MDk1MDQ1MDksIm5iZiI6MTYwOTUwMDkwOSwianRpIjoiRGZLeHFVTGFNSGV6Tzh5OSIsInN1YiI6IjQ1N2M3NDE1LWI2OTMtNGI3MS1iMmM5LTNlYjg0MDA1YzczMCIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjciLCJpZCI6IjQ1N2M3NDE1LWI2OTMtNGI3MS1iMmM5LTNlYjg0MDA1YzczMCIsInVzZXJfbmFtZSI6InZ5dnlkdGh3IiwiZW1haWwiOiJuaHRhbm9ueW1vdXM2NjZAZ21haWwuY29tIiwiYXZhdGFyIjoiaHR0cHM6XC9cL2kucGluaW1nLmNvbVwvMjM2eFwvM2JcLzgwXC85OFwvM2I4MDk4Y2NhZDhjMDM3ZjgyODI3Yzk3NjMwZmM0ZDUuanBnIn0.y54hSUDYKBY255pv8NMX0jIjs2O5xdVSaSDplo3g6F4', '840453452424', 'TPHCMMM', 'female', '/user.jpg', NULL, NULL, '2021-01-01 11:10:04', '2021-01-05 12:20:48'),
('d936fbe5-0b18-4e4c-85db-955662b33aca', 'Thuc', 'Nguyen', 'vyvydthwsad', 'nhtanonymosadus@gmail.com', NULL, '$2y$10$feWlDxxGeYm1iO/Udm41euSecMdKeGP1xbu0qps2rsa2MXI5yVYi6', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, '2021-01-01 11:15:08', '2021-01-01 11:15:08'),
('dc68c2db-a23c-4a36-9f8d-98922bef7800', 'sadas', 'dsadsad', 'vyvydthwssssssss', 'nhtanonymousadasds@gmail.com', NULL, '$2y$10$.XkTjGbEayNuZ7xhA9QdruuZzxaSo21NOPZF3HhPxnEhYmEWjwoAm', NULL, NULL, NULL, NULL, 'female', NULL, NULL, NULL, '2021-01-01 11:27:52', '2021-01-01 11:27:52'),
('efaf21d2-8e5a-4ef5-8992-22644db8576b', 'Thức', 'Nguyễn', 'nguyenthuc', 'nhtanonymous@gmail.com', NULL, '$2y$10$AXAAo3xcY5YLbL985bnl3eR5TPGReNck6UB5doI5gnOiY0CXPyFHG', NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9uZ3V5ZW50aHVjb2ZmaWNpYWwub3JnXC9zaG9wcGluZy1jYXJ0LWxhcmF2ZWwtYXBpXC9wdWJsaWNcL2FwaVwvdXNlcnNcL2xvZ2luIiwiaWF0IjoxNjIwOTYwNjQyLCJleHAiOjE2MjA5NjQyNDIsIm5iZiI6MTYyMDk2MDY0MiwianRpIjoiU3RvUjBoNXZ1elJWTkVoUSIsInN1YiI6ImVmYWYyMWQyLThlNWEtNGVmNS04OTkyLTIyNjQ0ZGI4NTc2YiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjciLCJpZCI6ImVmYWYyMWQyLThlNWEtNGVmNS04OTkyLTIyNjQ0ZGI4NTc2YiIsInVzZXJfbmFtZSI6Im5ndXllbnRodWMiLCJlbWFpbCI6Im5odGFub255bW91c0BnbWFpbC5jb20iLCJhdmF0YXIiOiJcL3VzZXIuanBnIn0.BITeuI2-kci9n-Y4NhtQsNedhhHVmQtdVV7E3QeSGXk', '8404054045242', 'TP.HCM', 'male', '/user.jpg', NULL, NULL, '2020-11-26 03:13:24', '2021-05-14 02:50:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_brand_slug` (`slug`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_cart_user_id` (`user_id`);

--
-- Indexes for table `cart_product`
--
ALTER TABLE `cart_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_c_p_cart_id` (`cart_id`),
  ADD KEY `idx_c_p_product_id` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_category_slug` (`slug`),
  ADD KEY `idx_category_parent_id` (`parent_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_comment_product_id` (`product_id`),
  ADD KEY `idx_comment_parent_id` (`parent_id`),
  ADD KEY `fk_comment_user` (`user_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order_user_id` (`user_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_o_p_order_id` (`order_id`),
  ADD KEY `idx_o_p_product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_product_slug` (`slug`),
  ADD KEY `idx_product_category_id` (`category_id`),
  ADD KEY `idx_product_brand_id` (`brand_id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_p_i_product` (`product_id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`product_id`,`tag_id`),
  ADD KEY `idx_p_t_product_id` (`product_id`),
  ADD KEY `idx_p_t_tag_id` (`tag_id`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_tag_slug` (`slug`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unq_u_user_name` (`user_name`),
  ADD UNIQUE KEY `unq_u_email` (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `cart_product`
--
ALTER TABLE `cart_product`
  ADD CONSTRAINT `fk_c_p_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `fk_c_p_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `fk_category_parent` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_parent` FOREIGN KEY (`parent_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comment_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `fk_o_p_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `fk_o_p_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `fk_p_i_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `fk_p_t_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_p_t_tag` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
