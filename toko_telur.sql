-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Jun 2023 pada 07.49
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_telur`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `stock_kg` int(11) NOT NULL,
  `price_kg` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `stock_kg`, `price_kg`, `created_at`, `updated_at`) VALUES
(1, 'Telur Ayam', 316, 23000, '0000-00-00 00:00:00', '2023-06-04 21:18:38'),
(6, 'Telur bebek', 116, 24000, '2023-06-03 20:04:35', '2023-06-03 20:04:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_kg` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `product_id`, `quantity`, `price_kg`, `total_price`, `type`, `created_at`, `updated_at`) VALUES
(6, 1, 6, 3, 24000, 72000, 'penjualan', '2023-06-02 20:42:39', '2023-06-05 20:42:39'),
(8, 2, 1, 2, 21000, 42000, 'penjualan', '2023-06-04 21:18:28', '2023-06-04 21:18:28'),
(9, 1, 6, 20, 20000, 400000, 'restock', '2023-06-02 21:20:31', '2023-06-05 21:20:31'),
(10, 1, 1, 310, 23000, 7130000, 'restock', '2023-06-05 21:20:45', '2023-06-05 21:20:45'),
(11, 1, 1, 2, 23000, 46000, 'penjualan', '2023-06-04 21:20:54', '2023-06-05 21:20:54'),
(12, 1, 1, 5, 23000, 115000, 'penjualan', '2023-06-05 21:21:05', '2023-06-05 21:21:05'),
(13, 1, 6, 1, 24000, 24000, 'penjualan', '2023-06-05 21:21:15', '2023-06-05 21:21:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `full_name`, `username`, `role`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Holiq Ibrahim', 'holiq', 'owner', '202cb962ac59075b964b07152d234b70', '2023-05-31 14:29:55', '2023-05-31 14:29:55'),
(2, 'Bayu123', 'babay', 'admin', '202cb962ac59075b964b07152d234b70', '2023-06-01 15:34:18', '2023-06-02 20:27:17'),
(4, 'wahyu111', 'www', 'admin', '202cb962ac59075b964b07152d234b70', '2023-06-02 20:13:24', '2023-06-02 20:23:05');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_transaction` (`user_id`),
  ADD KEY `product_transaction` (`product_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `product_transaction` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `user_transaction` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
