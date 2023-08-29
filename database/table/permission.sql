CREATE TABLE `permission` (
  `permission_id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `code` varchar(120) NOT NULL,
  `group` varchar(120) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE 'permission' 
  ADD PRIMARY KEY (`permission_id`);

ALTER TABLE `permission`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `permission` DROP INDEX `name`

ALTER TABLE `permission`
  DROP  (`name`);

ALTER TABLE `permission`
  ADD UNIQUE (`code`);


-- CRUD : c:Create, r:Read, u:Update, d:Delete

INSERT INTO `permission` (`name`,`code`,`group`) VALUES

('Read','product.Read','product'),
('Create','product.Create','product'),
('Update','product.Update','product'),
('Delete','product.Delete','product'),

('Read','order.Read','order'),
('Create','order.Create','order'),
('Update','order.Update','order'),
('Delete','order.Delete','order'),

('Read','customer.Read','customer'),
('Create','customer.Create','customer'),
('Update','customer.Update','customer'),
('Delete','customer.Delete','customer');








