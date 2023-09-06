

    
CREATE TABLE `payement_methode` (
  `payement_methode_id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `code` varchar(120) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `payement_methode`
  ADD PRIMARY KEY (`payement_methode_id`);

ALTER TABLE `payement_methode`
  MODIFY `payement_methode_id` int(11) NOT NULL AUTO_INCREMENT;


INSERT INTO `payement_methode` (`name`,`code`) VAlUES 
('Cash On Delivery','cod'),
('ABA Bank','aba'),
('ACLEDA Bank','ac'),
('Wing','wing'),
('Chip Mong','chm'),
('True Money ','trm');