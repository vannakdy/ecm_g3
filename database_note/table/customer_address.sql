
CREATE TABLE `customer_address` (
  `customer_address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL, -- FK (customer)
  `province_id` int(11) NOT NULL, -- FK (province)
  `firstname` varchar(120) NOT NULL,
  `lastname` varchar(120) NOT NULL,
  `tel` varchar(18) NOT NULL,
  `address_des` text NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`customer_address_id`);

ALTER TABLE `customer_address`
  MODIFY `customer_address_id` int(11) NOT NULL AUTO_INCREMENT;


