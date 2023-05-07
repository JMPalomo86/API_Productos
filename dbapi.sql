-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2023 at 10:05 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbapi`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregaCaracteristica` (IN `nombre` VARCHAR(255), IN `valor` VARCHAR(255))   INSERT INTO caracteristicas (nombre,valor,created_at) VALUE(nombre,valor,NOW())$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregaCategoria` (IN `nombre` VARCHAR(100))   INSERT INTO categorias (nombre,created_at)
VALUES (nombre,NOW())$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `agregaProducto` (IN `nombre` VARCHAR(200), IN `marca` VARCHAR(200), IN `codigo` INT, IN `idCategoria` INT)   INSERT INTO productos (nombre,marca,codigo,id_categoria,inactive,created_at) VALUE (nombre,marca,codigo,idCategoria,0,NOW())$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editaProducto` (IN `nombres` VARCHAR(100), IN `marcas` VARCHAR(100), IN `idCategoria` INT(100), IN `idProducto` INT(100))   UPDATE productos SET nombre = nombres, marca = marcas, id_categoria = idCategoria WHERE id = idProducto$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminaCaracteristica` (IN `id` INT(50))   DELETE FROM caracteristicas
WHERE id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminaProducto` (IN `idProducto` INT(100))   UPDATE productos SET inactive = 1, update_at=NOW() WHERE id = idProducto$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `existeCategoria` (`idCategoria` INT(100)) RETURNS INT(100)  BEGIN
    DECLARE cont INT;
    SET cont = (SELECT COUNT(*) FROM categorias where id=idCategoria);
    
    IF cont = 0 THEN
        RETURN cont ;
    ELSE
        RETURN idCategoria;
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `caracteristicas`
--

CREATE TABLE `caracteristicas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `caracteristicas`
--

INSERT INTO `caracteristicas` (`id`, `nombre`, `valor`, `created_at`, `updated_at`) VALUES
(5, 'inverter', 'Si', '2023-05-01 04:14:11', '2023-05-02 09:25:23'),
(10, 'inverter', 'SI', '2023-05-02 09:25:23', '2023-05-02 09:25:23');

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(0, 'No Tiene Categoria', '2023-04-29 05:57:07', '2023-05-02 17:10:38'),
(3, 'Muebles02', '2023-04-29 03:37:39', '2023-05-03 11:31:47'),
(6, 'Linea Blanca', '2023-05-02 17:10:38', '2023-05-02 17:10:38'),
(10, 'Muebles02', '2023-05-03 20:38:02', '2023-05-03 20:38:02');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_04_27_002431_create_api_table', 1),
(6, '2023_04_27_221418_create_caracteristicas_table', 1),
(7, '2023_04_28_221122_create_productos_table', 1),
(8, '2023_04_28_221353_create_categorias_table', 1),
(9, '2023_04_28_221456_create_prod_carac_table', 1),
(10, '2023_04_27_221456_create_prod_carac_table', 2),
(12, '2023_05_02_062407_create_product_details_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `codigo` int(11) NOT NULL,
  `id_categoria` bigint(20) UNSIGNED NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `marca`, `codigo`, `id_categoria`, `inactive`, `created_at`, `updated_at`) VALUES
(1, ' Aire acondicionado', 'marcare', 73736463, 0, 1, '2023-04-29 05:06:54', '2023-05-03 08:16:39'),
(2, 'sghjjjhhjjhd', 'marcare', 458, 0, 1, '2023-05-01 14:13:23', '2023-05-06 12:56:27'),
(3, 'sghjjjhhjjhd', 'marcare', 737346385, 10, 1, '2023-05-01 20:01:56', '2023-05-06 12:56:31'),
(4, 'nombre1565', 'marcare', 52258465, 0, 0, '2023-05-01 20:36:55', '2023-05-03 02:05:43'),
(5, 'amy asi', 'marcare', 4556658, 6, 0, '2023-05-02 10:20:56', '2023-05-02 10:20:56'),
(6, 'ultimo', 'marcare', 8373555, 0, 0, '2023-05-03 02:03:01', '2023-05-03 02:03:01'),
(7, 'actualiza7', 'marcare', 5454855, 0, 0, '2023-05-03 08:14:53', '2023-05-03 08:17:38'),
(8, 'sghjjjhhjjhd', 'marcare', 798446385, 6, 0, '2023-05-03 11:02:57', '2023-05-03 11:02:57'),
(9, 'es nueve', 'marcare', 453788, 0, 1, '2023-05-03 11:04:11', '2023-05-03 11:05:50'),
(10, 'setrty', 'wertyy', 34443, 0, 1, '2023-05-05 20:39:40', '2023-05-06 13:00:47'),
(11, 'productos', 'sus marcas', 2834475, 0, 0, '2023-05-05 20:40:16', '2023-05-05 20:40:16'),
(12, 'dfs', 'aergsfgset', 455456, 0, 0, '2023-05-05 22:09:10', '2023-05-05 22:09:10'),
(13, 'si enyskff', 'ksdjdjjdjdjdjsdks', 11111111, 6, 0, '2023-05-05 22:31:05', '2023-05-06 12:14:53'),
(14, 'nuekskd', 'sdfsdfsdf', 9894, 0, 0, '2023-05-06 00:02:08', '2023-05-06 00:02:08'),
(15, 'pepelepu', 'ultima', 33334535, 0, 0, '2023-05-06 10:12:09', '2023-05-06 12:05:20'),
(16, 'pepe', 'manuel', 443444, 6, 0, '2023-05-06 11:41:24', '2023-05-06 12:15:05');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_producto` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`id`, `id_producto`, `nombre`, `valor`, `created_at`, `updated_at`) VALUES
(14, 1, 'sdd', '34433', '2023-05-03 09:10:05', '2023-05-03 09:10:05'),
(15, 1, 'sdd', '34433', '2023-05-03 09:10:58', '2023-05-03 09:10:58'),
(16, 1, 'sdd', '34433', '2023-05-03 09:51:37', '2023-05-03 09:51:37'),
(17, 2, 'carateristica g', '34433', '2023-05-03 10:28:25', '2023-05-03 10:28:25');

-- --------------------------------------------------------

--
-- Table structure for table `prod_carac`
--

CREATE TABLE `prod_carac` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_producto` bigint(20) UNSIGNED NOT NULL,
  `id_caracteristicas` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `vista_productos`
-- (See below for the actual view)
--
CREATE TABLE `vista_productos` (
`nombre` varchar(255)
,`marca` varchar(255)
,`codigo` int(11)
,`categoria` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `vista_productos`
--
DROP TABLE IF EXISTS `vista_productos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_productos`  AS SELECT `prod`.`nombre` AS `nombre`, `prod`.`marca` AS `marca`, `prod`.`codigo` AS `codigo`, `cat`.`nombre` AS `categoria` FROM (`productos` `prod` join `categorias` `cat` on(`prod`.`id_categoria` = `cat`.`id`)) WHERE `prod`.`inactive` = 00  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `caracteristicas`
--
ALTER TABLE `caracteristicas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `productos_codigo_unique` (`codigo`),
  ADD KEY `productos_id_categoria_foreign` (`id_categoria`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_details_id_producto_foreign` (`id_producto`);

--
-- Indexes for table `prod_carac`
--
ALTER TABLE `prod_carac`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_carac_id_producto_foreign` (`id_producto`),
  ADD KEY `prod_carac_id_caracteristicas_foreign` (`id_caracteristicas`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `caracteristicas`
--
ALTER TABLE `caracteristicas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `prod_carac`
--
ALTER TABLE `prod_carac`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_id_categoria_foreign` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_id_producto_foreign` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Constraints for table `prod_carac`
--
ALTER TABLE `prod_carac`
  ADD CONSTRAINT `prod_carac_id_caracteristicas_foreign` FOREIGN KEY (`id_caracteristicas`) REFERENCES `caracteristicas` (`id`),
  ADD CONSTRAINT `prod_carac_id_producto_foreign` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
