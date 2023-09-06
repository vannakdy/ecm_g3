
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL ,
  `code` varchar(120) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

ALTER TABLE `role`
  ADD UNIQUE (`name`);

ALTER TABLE `role`
  ADD UNIQUE (`code`);

ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

INSERT INTO `role` (`name`,`code`) VALUES 
('Admin','amdin'),
('Manager','manger'),
('Accountant','accountant'),
('Online Staff','online_staff');
('Customer','customer');

