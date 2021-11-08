SELECT * FROM bank.account a
INNER JOIN bank.loan b
ON a.account_id = b.account_id;

SELECT  a.client_id, a.birth_number, b.type,a.district_id, di.A2 AS district_name FROM bank.client a
JOIN bank.disp b
ON a.client_id = b.client_id 
JOIN bank.account c 
ON c.account_id = b.account_id
JOIN bank.district di
ON di.A1 = a.district_id
WHERE b.type = 'OWNER';

select * from bank.client;
select * from bank.account;
select * from bank.district;

