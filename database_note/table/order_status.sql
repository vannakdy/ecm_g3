
CREATE TABLE `order_status` (
  `order_status_id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `message` text NOT NULL,
  `sort_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `order_status`
  ADD PRIMARY KEY (`order_status_id`);

ALTER TABLE `order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT;

--- INSERT ---
  --  Your 
  --       Phone denied Phone denied.
  --       Delivered  Your order is complete.
  --       Packed  Your order has been packed.
  --       Shipped   Your order has been shipped!
  --       Store pick up  Your order is ready for store pickup!
  --       Pending Your order has been placed successfully!
  
INSERT INTO `order_status` (`name`,`message`,`sort_order`) VAlUES 
('Pending',' Your order has been placed successfully!.',1),
('Packed','Your order has been packed.',2),
('Shipped','Your order has been shipped!',3),
('Delivered','Your order is complete.',4),
('Canceled','order has been canceled.',5),
('Store pick up','Your order is ready for store pickup!',6),
('Phone denied','Denied Phone denied.',7),
('Cancel','Your  has been Canceled.',8);