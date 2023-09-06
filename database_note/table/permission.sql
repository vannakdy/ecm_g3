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

('Read','category.Read','category'),
('Create','category.Create','category'),
('Update','category.Update','category'),
('Delete','category.Delete','category');


INSERT INTO `permission` (`name`,`code`,`group`) VALUES
('Read','category.Read','category'),
('Create','category.Create','category'),
('Update','category.Update','category'),
('Delete','category.Delete','category');

13,14,15,16

INSERT INTO `role_permission` (`role_id`,`permission_id`) VALUES

(1,13)
(1,14)
(1,15)
(1,16)

(4,13)
(4,14)
(4,15)











