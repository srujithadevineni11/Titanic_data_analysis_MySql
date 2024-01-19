SELECT * FROM titanic.Titanic;
use titanic;
SELECT * FROM titanic;
-- 1. Show the first 10 rows of the dataset.
SELECT * FROM titanic limit 10;
-- last 10 rows of the dataset
SELECT * FROM titanic order by PassengerId desc limit 10;
-- 2. Find the number of passengers who survived.
select count(*) FROM titanic where survived="1";
-- 3. Find the average age of all passengers.
select avg(age) FROM titanic;
-- 4. Find the number of passengers in each class.
SELECT pclass,count(pclass) FROM titanic group by pclass ;
-- --5. Find the first 10 rows of the dataset sorted by passenger class in descending order
SELECT * FROM titanic order by pclass limit 10 ;
-- -- 6. Find the number of passengers in each class sorted by class in ascending order.
SELECT pclass,count(pclass) FROM titanic group by pclass order by pclass ;
-- -- 7. Find the average fare paid by passengers in each class.
SELECT pclass,count(pclass),avg(Fare) FROM titanic group by pclass order by pclass ;
-- 8. Find the name of the passenger with the highest fare.
select Name,fare  FROM titanic order by fare desc limit 3;
-- - 9. Find the name of the passenger who had the highest age among the survivors.
select Name,age  FROM titanic where Survived=1 order by age desc limit 1;
-- 10. Find the number of passengers who paid more than the average fare.
select count(*)  FROM titanic where fare>(select avg(fare) FROM titanic);
-- 11. Find the name of the passenger who had the most parents or children on board.
select name from titanic where parch=(select max(parch) FROM titanic);
-- --12. Find the number of male and female passengers who survived,
-- - and order the results by sex in ascending order:
select sex,count(*) FROM titanic where survived="1" group by Sex order by sex asc;
-- - 13. Find the name, age, and fare of the oldest passenger who survived.
select name,age,fare FROM titanic where survived="1" and age=(select max(age) FROM titanic);
-- 14. Find the name and age of the youngest female passenger who survived in third class.
select name,age from titanic where Survived=1 and Pclass=3 and Sex="female" and age=(select min(age) FROM titanic where Survived=1 and Pclass=3 and Sex="female") ;
-- -- 15. Find Number of male and female passengers.
 select 
 sum(case when Sex="female" then 1 else 0 end) as female_count,
 sum(case when sex="male" then 1 else 0 end)as male_count
 from titanic;
--  16. Select all passengers who traveled in a cabin that was not shared by other passengers.
SELECT * FROM titanic where cabin in (SELECT Cabin FROM titanic group by cabin having count(*)=1);

