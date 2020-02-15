-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 14 Feb 2020 pada 17.39
-- Versi Server: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kulina_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_category`
--

CREATE TABLE `ku_category` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_order`
--

CREATE TABLE `ku_order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_order_detail`
--

CREATE TABLE `ku_order_detail` (
  `id` int(11) NOT NULL,
  `user_location_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `delivery_date` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_order_detail_status`
--

CREATE TABLE `ku_order_detail_status` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_order_status`
--

CREATE TABLE `ku_order_status` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_product`
--

CREATE TABLE `ku_product` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `effective_date` date NOT NULL,
  `effective_until` date NOT NULL,
  `photo` varchar(50) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_product_category`
--

CREATE TABLE `ku_product_category` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_product_status`
--

CREATE TABLE `ku_product_status` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_user`
--

CREATE TABLE `ku_user` (
  `id` int(11) NOT NULL,
  `name` varchar(70) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `password_hash` char(13) NOT NULL,
  `salt` char(13) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_user_location`
--

CREATE TABLE `ku_user_location` (
  `id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `location` point NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_user_location_status`
--

CREATE TABLE `ku_user_location_status` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_user_location_type`
--

CREATE TABLE `ku_user_location_type` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ku_user_status`
--

CREATE TABLE `ku_user_status` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ku_category`
--
ALTER TABLE `ku_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ku_order`
--
ALTER TABLE `ku_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `ku_order_detail`
--
ALTER TABLE `ku_order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_location_id` (`user_location_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `ku_order_detail_status`
--
ALTER TABLE `ku_order_detail_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ku_order_status`
--
ALTER TABLE `ku_order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ku_product`
--
ALTER TABLE `ku_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `ku_product_category`
--
ALTER TABLE `ku_product_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `ku_product_status`
--
ALTER TABLE `ku_product_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ku_user`
--
ALTER TABLE `ku_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `ku_user_location`
--
ALTER TABLE `ku_user_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `status` (`status`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ku_user_location_status`
--
ALTER TABLE `ku_user_location_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ku_user_location_type`
--
ALTER TABLE `ku_user_location_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ku_user_status`
--
ALTER TABLE `ku_user_status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ku_category`
--
ALTER TABLE `ku_category`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `ku_order`
--
ALTER TABLE `ku_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4057;
--
-- AUTO_INCREMENT for table `ku_order_detail`
--
ALTER TABLE `ku_order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ku_order_detail_status`
--
ALTER TABLE `ku_order_detail_status`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ku_order_status`
--
ALTER TABLE `ku_order_status`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `ku_product`
--
ALTER TABLE `ku_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=587;
--
-- AUTO_INCREMENT for table `ku_product_category`
--
ALTER TABLE `ku_product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=308;
--
-- AUTO_INCREMENT for table `ku_product_status`
--
ALTER TABLE `ku_product_status`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ku_user`
--
ALTER TABLE `ku_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=920;
--
-- AUTO_INCREMENT for table `ku_user_location`
--
ALTER TABLE `ku_user_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1692;
--
-- AUTO_INCREMENT for table `ku_user_location_status`
--
ALTER TABLE `ku_user_location_status`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ku_user_location_type`
--
ALTER TABLE `ku_user_location_type`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ku_user_status`
--
ALTER TABLE `ku_user_status`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `ku_order`
--
ALTER TABLE `ku_order`
  ADD CONSTRAINT `ku_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ku_user` (`id`),
  ADD CONSTRAINT `ku_order_ibfk_2` FOREIGN KEY (`status`) REFERENCES `ku_order_status` (`id`);

--
-- Ketidakleluasaan untuk tabel `ku_order_detail`
--
ALTER TABLE `ku_order_detail`
  ADD CONSTRAINT `ku_order_detail_ibfk_1` FOREIGN KEY (`user_location_id`) REFERENCES `ku_user_location` (`id`),
  ADD CONSTRAINT `ku_order_detail_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `ku_order` (`id`),
  ADD CONSTRAINT `ku_order_detail_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `ku_product` (`id`),
  ADD CONSTRAINT `ku_order_detail_ibfk_4` FOREIGN KEY (`status`) REFERENCES `ku_order_detail_status` (`id`);

--
-- Ketidakleluasaan untuk tabel `ku_product`
--
ALTER TABLE `ku_product`
  ADD CONSTRAINT `ku_product_ibfk_1` FOREIGN KEY (`status`) REFERENCES `ku_product_status` (`id`);

--
-- Ketidakleluasaan untuk tabel `ku_product_category`
--
ALTER TABLE `ku_product_category`
  ADD CONSTRAINT `ku_product_category_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `ku_product` (`id`),
  ADD CONSTRAINT `ku_product_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `ku_category` (`id`);

--
-- Ketidakleluasaan untuk tabel `ku_user`
--
ALTER TABLE `ku_user`
  ADD CONSTRAINT `ku_user_ibfk_1` FOREIGN KEY (`status`) REFERENCES `ku_user_status` (`id`);

--
-- Ketidakleluasaan untuk tabel `ku_user_location`
--
ALTER TABLE `ku_user_location`
  ADD CONSTRAINT `ku_user_location_ibfk_1` FOREIGN KEY (`type`) REFERENCES `ku_user_location_type` (`id`),
  ADD CONSTRAINT `ku_user_location_ibfk_2` FOREIGN KEY (`status`) REFERENCES `ku_user_location_status` (`id`),
  ADD CONSTRAINT `ku_user_location_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `ku_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
