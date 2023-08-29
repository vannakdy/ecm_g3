CREATE TABLE `role_menu` (
  `role_id` varchar(120) NOT NULL,
  `menu_id` int(120) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE 'role_menu' ADD CONSTRAINT "PK_roleId_roleMenu"
PRIMARY KEY (`role_id` , `menu_id`);

COMMIT;

