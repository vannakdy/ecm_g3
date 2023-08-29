CREATE TABLE `role_permission` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `role_permission`
 ADD PRIMARY KEY (`role_id` , `permission_id`);

COMMIT;



INSERT INTO `role_permission` (`role_id`,`permission_id`) VALUES
-- admine
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),
(1,10),
(1,11),
(1,12),

-- staff online (list product, list order, list customer)
(4,1),
(4,5),
(4,9),



