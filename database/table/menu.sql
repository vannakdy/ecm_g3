
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL UNIQUE,
  `code` varchar(120) NOT NULL UNIQUE,
  `group` varchar(120) DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

ALTER TABLE `menu`
  ADD UNIQUE (`name`);

ALTER TABLE `menu`
  ADD UNIQUE (`code`);

ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

INSERT INTO `menu` ('name','code',null) VALUES 
('Dashboard','amdin',null),


('Category','category'),
('Product','product'),

('Order','order','Order'),

('Customer','customer', 'Customer'),
('Customer Cart','customer_cart', 'Customer'),
('Castomer Wishlist','customer_wishlist', 'Customer'),

('User','user', 'User'),
('Role','role', 'User'),
('Menu','menu', 'User'),
('Permmission','permission', 'User'),

('Status Order','status_order', 'Other'),
('Payment Method','payment_method', 'Other'),
('Province','province', 'Other'),
