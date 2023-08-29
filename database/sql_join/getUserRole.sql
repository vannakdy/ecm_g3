SELECT
	c.firstname
    ,c.lastname
   	,r.name as role_name
    ,p.code
FROM customer c 
INNER JOIN role r ON c.role_id = r.role_id
INNER JOIN role_permission rp ON r.role_id = rp.role_id
INNER JOIN permission p ON rp.permission_id = p.permission_id
WHERE c.customer_id = 1;