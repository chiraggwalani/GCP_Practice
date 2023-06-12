SELECT * FROM employee
SELECT name FROM dept
SELECT name FROM `parts` WHERE qoh=0
SELECT name FROM `employee` WHERE salary BETWEEN 10000 and 12000
SELECT name,price, price+price*0.10 as "Increased Price" from item where number in (select item from sale WHERE item in (SELECT number from item where dept=49))
select name,salary,number from employee where SUBSTRING_INDEX(name, ',' , -1) like's%'
SELECT name,weight FROM `parts` WHERE number in (SELECT part from supply WHERE supplier=(SELECT number from supplier where name='DEC'))
SELECT p.name,p.weight FROM parts p INNER JOIN supply s on s.part = p.number INNER join supplier sp on sp.number=s.supplier WHERE sp.name='DEC'
SELECT name,weight,color FROM parts where weight>(select weight FROM parts where name='tape drive')
select p.name, p.color ,p.weight from parts p, parts pt where pt.name = 'tape drive' AND p.weight >pt.weight
SELECT AVG(salary) FROM `employee` WHERE manager=199
select sp.name, count(i.number) as 'items' from supplier sp, item i where i.supplier=sp.number GROUPBY sp.name
SELECT sup.name, SUM(p.weight*sp.quantity) weight FROM parts p, supplier sup, supply sp, city c WHERE p.number = sp.part AND sup.number = sp.supplier AND sup.city = c.name AND c.state = 'Mass'  GROUP BY sup.name
INSERT INTO `supplier`(`number`, `name`, `city`) VALUES (111,'Manual','New York')

BEGIN
	SELECT name,salary from employee where number in (SELECT manager from dept where store=stor);
    UPDATE employee SET salary = (salary+salary*0.05) where number in (SELECT manager from dept where store= stor);
    SELECT name,salary from employee where number in (SELECT manager from dept where store= stor);
END


