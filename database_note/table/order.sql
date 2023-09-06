

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `payement_methode_id` int(11) NOT NULL,
  `invoice_no` varchar(120) NOT NULL,
  `order_total` decimal(6,0)  NOT NULL,
  `comment` text DEFAULT NULL,
  `firstname` varchar(120) NOT NULL,
  `lastname` varchar(120) NOT NULL,
  `telelphone` varchar(18) NOT NULL,
  `address_des` text NOT NULL, // address_id
  `status` tinyint(1) DEFAULT 1,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;