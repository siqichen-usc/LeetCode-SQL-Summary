# LeetCode SQL Summary

## Intro

After finishing all 102 Leetcode SQL questions, I feel the urge to summarize them by topics they are trying to test. 

This note aims to **help people _learn and review SQL effeciently_**, espeically when trying to **have a quick catch up on a certain topic**, e.g. complex join, window function, recursive CTE and etc.

And for the first draft, I mainly focus on **_T-SQL/MS SQL Server_**.

## LeetCode SQL Questions by Topcis


### Basics

| **#** | **Title** | **Difficulty** | **Solution** | 
|---|---|---|---|
| 182 | [Duplicate Emails](https://leetcode.com/problems/duplicate-emails/) | Easy | [Soln.](../master/Basics/182_Duplicate_Emails.sql) |
| 511 | [Game Play Analysis I](https://leetcode.com/problems/game-play-analysis-i/) | Easy | [Soln.](../master/Basics/511_Game_Play_Analysis_I.sql) |
| 578 | [Get Highest Answer Rate Question](https://leetcode.com/problems/get-highest-answer-rate-question/) | Medium | [Soln.](../master/Basics/578_Get_Highest_Answer_Rate_Question.sql) | 
| 584 | [Find Customer Referee](https://leetcode.com/problems/find-customer-referee/) | Easy | [Soln.](../master/Basics/584_Find_Customer_Referee.sql) | 
| 586 | [Customer Placing the Largest Number of Orders](https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/) | Easy | [Soln.](../master/Basics/586_Customer_Placing_the_Largest_Number_of_Orders.sql) | 
| 595 | [Big Countries](https://leetcode.com/problems/big-countries/) | Easy | [Soln.](../master/Basics/595_Big_Countries.sql) |
| 596 | [Classes More Than 5 Students](https://leetcode.com/problems/classes-more-than-5-students/) | Easy | [Soln.](../master/Basics/596_Classes_More_Than_5_Students.sql) | 

### SQL Command

| **#** | **Title** | **Difficulty** | **Solution** | 
|---|---|---|---|
| 196 | [Delete Duplicate Emails](https://leetcode.com/problems/delete-duplicate-emails/) | Easy | [Soln.](../master/SQL-Command/196_Delete_Duplicate_Emails.sql) |

### Join


- Simple Join

| **#** | **Title** | **Difficulty** | **Solution** | 
|---|---|---|---|
| 175 | [Combine Two Tables](https://leetcode.com/problems/combine-two-tables/) | Easy | [Soln.](../master/Join/Simple-Join/175_Combine_Two_Tables.sql) |
| 181 | [Employees Earning More Than Their Managers](https://leetcode.com/problems/employees-earning-more-than-their-managers/) | Easy | [Soln.](../master/Join/Simple-Join/181_Employees_Earning_More_Than_Their_Managers.sql) |
| 183 | [Customers Who Never Order](https://leetcode.com/problems/customers-who-never-order/) | Easy | [Soln.](../master/Join/Simple-Join/183_Customers_Who_Never_Order.sql) |
| 184 | [Department Highest Salary](https://leetcode.com/problems/department-highest-salary/) | Medium | [Soln.](../master/Join/Simple-Join/184_Department_Highest_Salary.sql) |
| 197 | [Rising Temperature](https://leetcode.com/problems/rising-temperature/) | Easy | [Soln.](../master/Join/Simple-Join/197_Rising_Temperature.sql) |
| 262 | [Trips and Users](https://leetcode.com/problems/trips-and-users/) | Hard | [Soln.](../master/Join/Simple-Join/262_Trips_and_Users.sql) |
| 512 | [Game Play Analysis II](https://leetcode.com/problems/game-play-analysis-ii/) | Easy | [Soln.](../master/Join/Simple-Join/512_Game_Play_Analysis_II.sql) |
| 550 | [Game Play Analysis IV](https://leetcode.com/problems/game-play-analysis-iv/) | Medium | [Soln.](../master/Join/Simple-Join/550_Game_Play_Analysis_IV.sql) |
| 570 | [Managers with at Least 5 Direct Reports](https://leetcode.com/problems/managers-with-at-least-5-direct-reports/) | Medium | [Soln.](../master/Join/Simple-Join/570_Managers_with_at_Least_5_Direct_Reports.sql) |
| 574 | [Winning Candidate](https://leetcode.com/problems/winning-candidate/) | Medium | [Soln.](../master/Join/Simple-Join/574_Winning_Candidate.sql) |
| 577 | [Employee Bonus](https://leetcode.com/problems/employee-bonus/) | Easy | [Soln.](../master/Join/Simple-Join/577_Employee_Bonus.sql) |
| 580 | [Count Student Number in Departments](https://leetcode.com/problems/count-student-number-in-departments/) | Medium | [Soln.](../master/Join/Simple-Join/580_Count_Student_Number_in_Departments.sql) | 
| 607 | [Sales Person](https://leetcode.com/problems/sales-person/) | Easy | [Soln.](../master/Join/Simple-Join/607_Sales_Person.sql) | 
| 614 | [Second Degree Follower](https://leetcode.com/problems/second-degree-follower/) | Medium | [Soln.](../master/Join/Simple-Join/614_Second_Degree_Follower.sql) | 



- Advanced Join 



| **#** | **Title** | **Difficulty** | **Solution** | 
|---|---|---|---|
| 180 | [Consecutive Numbers](https://leetcode.com/problems/consecutive-numbers/) | Medium | [Soln.](../master/Join/Advanced-Join/180_Consecutive_Numbers.sql) |
| 196 | [Delete Duplicate Emails](https://leetcode.com/problems/delete-duplicate-emails/) | Easy | [Soln.](../master/Join/Advanced-Join/196_Delete_Duplicate_Emails.sql) |
| 534 | [Game Play Analysis III](https://leetcode.com/problems/game-play-analysis-iii/) | Medium | [Soln.](../master/Join/Advanced-Join/534_Game_Play_Analysis_III.sql) |
| 569 | [Median Employee Salary](https://leetcode.com/problems/median-employee-salary/) | Hard | [Soln.](../master/Join/Advanced-Join/569_Median_Employee_Salary.sql) |
| 579 | [Find Cumulative Salary of an Employee](https://leetcode.com/problems/find-cumulative-salary-of-an-employee/) | Hard | [Soln.](../master/Join/Advanced-Join/579_Find_Cumulative_Salary_of_an_Employee.sql) |
| 601 | [Human Traffic of Stadium](https://leetcode.com/problems/human-traffic-of-stadium/) | Hard | [Soln.](../master/Join/Advanced-Join/601_Human_Traffic_of_Stadium.sql) | 
| 603 | [Consecutive Available Seats](https://leetcode.com/problems/consecutive-available-seats/) | Easy | [Soln.](../master/Join/Advanced-Join/603_Consecutive_Available_Seats.sql) | 
| 612 | [Shortest Distance in a Plane](https://leetcode.com/problems/shortest-distance-in-a-plane/) | Medium | [Soln.](../master/Join/Advanced-Join/612_Shortest_Distance_in_a_Plane.sql) | 
| 613 | [Shortest Distance in a Line](https://leetcode.com/problems/shortest-distance-in-a-line/) | Easy | [Soln.](../master/Join/Advanced-Join/613_Shortest_Distance_in_a_Line.sql) | 



### Subquery

- Simple Subquery

| **#** | **Title** | **Difficulty** | **Solution** | 
|---|---|---|---|
| 176 | [Second Highest Salary](https://leetcode.com/problems/second-highest-salary/) | Easy | [Soln.](../master/Subquery/Simple-Subquery/176_Second_Highest_Salary.sql)|
| 183 | [Customers Who Never Order](https://leetcode.com/problems/customers-who-never-order/) | Easy | [Soln.](../master/Subquery/Simple-Subquery/183_Customers_Who_Never_Order.sql) |
| 184 | [Department Highest Salary](https://leetcode.com/problems/department-highest-salary/) | Medium | [Soln.](../master/Subquery/Simple-Subquery/184_Department_Highest_Salary.sql) |
| 196 | [Delete Duplicate Emails](https://leetcode.com/problems/delete-duplicate-emails/) | Easy | [Soln.](../master/Subquery/Simple-Subquery/196_Delete_Duplicate_Emails.sql) |
| 197 | [Rising Temperature](https://leetcode.com/problems/rising-temperature/) | Easy | [Soln.](../master/Subquery/Simple-Subquery/197_Rising_Temperature.sql) |
| 512 | [Game Play Analysis II](https://leetcode.com/problems/game-play-analysis-ii/) | Easy | [Soln.](../master/Subquery/Simple-Subquery/512_Game_Play_Analysis_II.sql) |
| 569 | [Median Employee Salary](https://leetcode.com/problems/median-employee-salary/) | Hard | [Soln.](../master/Subquery/Simple-Subquery/569_Median_Employee_Salary.sql) |
| 570 | [Managers with at Least 5 Direct Reports](https://leetcode.com/problems/managers-with-at-least-5-direct-reports/) | Medium | [Soln.](../master/Subquery/Simple-Subquery/570_Managers_with_at_Least_5_Direct_Reports.sql) |
| 571 | [Find Median Given Frequency of Numbers](https://leetcode.com/problems/find-median-given-frequency-of-numbers/) | Hard | [Soln.](../master/Subquery/Simple-Subquery/571_Find_Median_Given_Frequency_of_Numbers.sql) |
| 574 | [Winning Candidate](https://leetcode.com/problems/winning-candidate/) | Medium | [Soln.](../master/Subquery/Simple-Subquery/574_Winning_Candidate.sql) |
| 579 | [Find Cumulative Salary of an Employee](https://leetcode.com/problems/find-cumulative-salary-of-an-employee/) | Hard | [Soln.](../master/Subquery/Simple-Subquery/579_Find_Cumulative_Salary_of_an_Employee.sql) | 
| 580 | [Count Student Number in Departments](https://leetcode.com/problems/count-student-number-in-departments/) | Medium | [Soln.](../master/Subquery/Simple-Subquery/580_Count_Student_Number_in_Departments.sql) | 
| 602 | [Friend Requests II: Who Has the Most Friends](https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/) | Medium |  [Soln.](../master/Subquery/Simple-Subquery/602_Friend_Requests_II_Who_Has_the_Most_Friends.sql) | 
| 603 | [Consecutive Available Seats](https://leetcode.com/problems/consecutive-available-seats/) | Easy | [Soln.](../master/Subquery/Simple-Subquery/603_Consecutive_Available_Seats.sql) | 
| 607 | [Sales Person](https://leetcode.com/problems/sales-person/) | Easy | [Soln.](../master/Subquery/Simple-Subquery/607_Sales_Person.sql) | 
| 613 | [Shortest Distance in a Line](https://leetcode.com/problems/shortest-distance-in-a-line/) | Easy | [Soln.](../master/Subquery/Simple-Subquery/613_Shortest_Distance_in_a_Line.sql) | 
| 614 | [Second Degree Follower](https://leetcode.com/problems/second-degree-follower/) | Medium | [Soln.](../master/Subquery/Simple-Subquery/614_Second_Degree_Follower.sql) | 

-  Advanced Subquery

| **#** | **Title** | **Difficulty** | **Solution** | 
|---|---|---|---|
| 262 | [Trips and Users](https://leetcode.com/problems/trips-and-users/) | Hard | [Soln.](../master/Subquery/Advanced-Subquery/262_Trips_and_Users.sql) |
| 550 | [Game Play Analysis IV](https://leetcode.com/problems/game-play-analysis-iv/) | Medium | [Soln.](../master/Subquery/Advanced-Subquery/550_Game_Play_Analysis_IV.sql) |
| 569 | [Median Employee Salary](https://leetcode.com/problems/median-employee-salary/) | Hard | [Soln.](../master/Subquery/Advanced-Subquery/569_Median_Employee_Salary.sql) |
| 585 | [Investments in 2016](https://leetcode.com/problems/investments-in-2016/) | Medium | [Soln.](../master/Subquery/Advanced-Subquery/585_Investments_in_2016.sql) | 
| 597 | [Friend Requests I: Overall Acceptance Rate](https://leetcode.com/problems/friend-requests-i-overall-acceptance-rate/) | Easy | [Soln.](../master/Subquery/Advanced-Subquery/597_Friend_Requests_I_Overall_Acceptance_Rate.sql) | 
| 601 | [Human Traffic of Stadium](https://leetcode.com/problems/human-traffic-of-stadium/) | Hard | [Soln.](../master/Subquery/Advanced-Subquery/601_Human_Traffic_of_Stadium.sql) | 

-  Recursive CTE

| **#** | **Title** | **Difficulty** | **Solution** | 
|---|---|---|---|




### Window Function

| **#** | **Title** | **Difficulty** | **Solution** | 
|---|---|---|---|
| 176 | [Second Highest Salary](https://leetcode.com/problems/second-highest-salary/) | Easy | [Soln.](../master/Window-Function/176_Second_Highest_Salary.sql) |
| 177 | [Nth Highest Salary](https://leetcode.com/problems/nth-highest-salary/) | Medium | [Soln.](../master/Window-Function/177_Nth_Highest_Salary.sql) |
| 178 | [Rank Scores](https://leetcode.com/problems/rank-scores/) | Medium | [Soln.](../master/Window-Function/178_Rank_Scores.sql) |
| 180 | [Consecutive Numbers](https://leetcode.com/problems/consecutive-numbers/) | Medium | [Soln.](../master/Window-Function/180_Consecutive_Numbers.sql) |
| 184 | [Department Highest Salary](https://leetcode.com/problems/department-highest-salary/) | Medium | [Soln.](../master/Window-Function/184_Department_Highest_Salary.sql) |
| 185 | [Department Top Three Salaries](https://leetcode.com/problems/department-top-three-salaries/) | Hard |  [Soln.](../master/Window-Function/185_Department_Top_Three_Salaries.sql) |
| 197 | [Rising Temperature](https://leetcode.com/problems/rising-temperature/) | Easy | [Soln.](../master/Window-Function/197_Rising_Temperature.sql) |
| 512 | [Game Play Analysis II](https://leetcode.com/problems/game-play-analysis-ii/) | Easy | [Soln.](../master/Window-Function/512_Game_Play_Analysis_II.sql) |
| 534 | [Game Play Analysis III](https://leetcode.com/problems/game-play-analysis-iii/) | Medium | [Soln.](../master/Window-Function/534_Game_Play_Analysis_III.sql) |
| 550 | [Game Play Analysis IV](https://leetcode.com/problems/game-play-analysis-iv/) | Medium | [Soln.](../master/Window-Function/550_Game_Play_Analysis_IV.sql) |
| 569 | [Median Employee Salary](https://leetcode.com/problems/median-employee-salary/) | Hard | [Soln.](../master/Window-Function/569_Median_Employee_Salary.sql) |
| 571 | [Find Median Given Frequency of Numbers](https://leetcode.com/problems/find-median-given-frequency-of-numbers/) | Hard | [Soln.](../master/Window-Function/571_Find_Median_Given_Frequency_of_Numbers.sql) |
| 579 | [Find Cumulative Salary of an Employee](https://leetcode.com/problems/find-cumulative-salary-of-an-employee/) | Hard | [Soln.](../master/Window-Function/579_Find_Cumulative_Salary_of_an_Employee.sql) | 
| 585 | [Investments in 2016](https://leetcode.com/problems/investments-in-2016/) | Medium | [Soln.](../master/Window-Function/585_Investments_in_2016.sql) | 
| 601 | [Human Traffic of Stadium](https://leetcode.com/problems/human-traffic-of-stadium/) | Hard | [Soln.](../master/Window-Function/601_Human_Traffic_of_Stadium.sql) | 
| 603 | [Consecutive Available Seats](https://leetcode.com/problems/consecutive-available-seats/) | Easy | [Soln.](../master/Window-Function/603_Consecutive_Available_Seats.sql) | 
| 613 | [Shortest Distance in a Line](https://leetcode.com/problems/shortest-distance-in-a-line/) | Easy | [Soln.](../master/Window-Function/613_Shortest_Distance_in_a_Line.sql) | 


### CASE WHEN

| **#** | **Title** | **Difficulty** | **Solution** | 
|---|---|---|---|
| 262 | [Trips and Users](https://leetcode.com/problems/trips-and-users/) | Hard | [Soln.](../master/CASE-WHEN/262_Trips_and_Users.sql) |
| 597 | [Friend Requests I: Overall Acceptance Rate](https://leetcode.com/problems/friend-requests-i-overall-acceptance-rate/) | Easy | [Soln.](../master/CASE-WHEN/597_Friend_Requests_I_Overall_Acceptance_Rate.sql) | 
| 608 | [Tree Node](https://leetcode.com/problems/tree-node/) | Medium | [Soln.](../master/CASE-WHEN/608_Tree_Node.sql) | 
| 610 | [Triangle Judgement](https://leetcode.com/problems/triangle-judgement/) | Easy | [Soln.](../master/CASE-WHEN/610_Triangle_Judgement.sql) | 


### OFFSET FETCH

| **#** | **Title** | **Difficulty** | **Solution** | 
|---|---|---|---|
| 176 | [Second Highest Salary](https://leetcode.com/problems/second-highest-salary/) | Easy | [Soln.](../blob/master/OFFSET-FETCH/176_Second_Highest_Salary.sql) |
| 177 | [Nth Highest Salary](https://leetcode.com/problems/nth-highest-salary/) | Medium | [Soln.](../master/OFFSET-FETCH/177_Nth_Highest_Salary.sql) |



### PIVOT & UNPIVOT

| **#** | **Title** | **Difficulty** | **Solution** | 
|---|---|---|---|
| 602 | [Friend Requests II: Who Has the Most Friends](https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/) | Medium |  [Soln.](../master/PIVOT-UNPIVOT/602_Friend_Requests_II_Who_Has_the_Most_Friends.sql) | 


### Variable

| **#** | **Title** | **Difficulty** | **Solution** | 
|---|---|---|---|
| 597 | [Friend Requests I: Overall Acceptance Rate](https://leetcode.com/problems/friend-requests-i-overall-acceptance-rate/) | Easy | [Soln.](../master/Variable/597_Friend_Requests_I_Overall_Acceptance_Rate.sql) | 



## LeetCode SQL Questions by ID

 **#** | **Title** | **Difficulty** | **Solution** |
|---|---|---|---|
| 175 | [Combine Two Tables](https://leetcode.com/problems/combine-two-tables/) | Easy | [Soln.](../master/Questions_by_ID/175_Combine_Two_Tables.sql) |
| 176 | [Second Highest Salary](https://leetcode.com/problems/second-highest-salary/) | Easy | [Soln.](../master/Questions_by_ID/176_Second_Highest_Salary.sql) |
| 177 | [Nth Highest Salary](https://leetcode.com/problems/nth-highest-salary/) | Medium | [Soln.](../master/Questions_by_ID/177_Nth_Highest_Salary.sql) |
| 178 | [Rank Scores](https://leetcode.com/problems/rank-scores/) | Medium | [Soln.](../master/Questions_by_ID/178_Rank_Scores.sql) |
| 180 | [Consecutive Numbers](https://leetcode.com/problems/consecutive-numbers/) | Medium | [Soln.](../master/Questions_by_ID/180_Consecutive_Numbers.sql) |
| 181 | [Employees Earning More Than Their Managers](https://leetcode.com/problems/employees-earning-more-than-their-managers/) | Easy | [Soln.](../master/Questions_by_ID/181_Employees_Earning_More_Than_Their_Managers.sql) |
| 182 | [Duplicate Emails](https://leetcode.com/problems/duplicate-emails/) | Easy | [Soln.](../master/Questions_by_ID/182_Duplicate_Emails.sql) |
| 183 | [Customers Who Never Order](https://leetcode.com/problems/customers-who-never-order/) | Easy | [Soln.](../master/Questions_by_ID/183_Customers_Who_Never_Order.sql) |
| 184 | [Department Highest Salary](https://leetcode.com/problems/department-highest-salary/) | Medium | [Soln.](../master/Questions_by_ID/184_Department_Highest_Salary.sql) |
| 185 | [Department Top Three Salaries](https://leetcode.com/problems/department-top-three-salaries/) | Hard | [Soln.](../master/Questions_by_ID/185_Department_Top_Three_Salaries.sql) |
| 196 | [Delete Duplicate Emails](https://leetcode.com/problems/delete-duplicate-emails/) | Easy | [Soln.](../master/Questions_by_ID/196_Delete_Duplicate_Emails.sql) |
| 197 | [Rising Temperature](https://leetcode.com/problems/rising-temperature/) | Easy | [Soln.](../master/Questions_by_ID/197_Rising_Temperature.sql) |
| 262 | [Trips and Users](https://leetcode.com/problems/trips-and-users/) | Hard | [Soln.](../master/Questions_by_ID/262_Trips_and_Users.sql) |
| 511 | [Game Play Analysis I](https://leetcode.com/problems/game-play-analysis-i/) | Easy | [Soln.](../master/Questions_by_ID/511_Game_Play_Analysis_I.sql) |
| 512 | [Game Play Analysis II](https://leetcode.com/problems/game-play-analysis-ii/) | Easy | [Soln.](../master/Questions_by_ID/512_Game_Play_Analysis_II.sql) |
| 534 | [Game Play Analysis III](https://leetcode.com/problems/game-play-analysis-iii/) | Medium | [Soln.](../master/Questions_by_ID/534_Game_Play_Analysis_III.sql) |
| 550 | [Game Play Analysis IV](https://leetcode.com/problems/game-play-analysis-iv/) | Medium | [Soln.](../master/Questions_by_ID/550_Game_Play_Analysis_IV.sql) |
| 569 | [Median Employee Salary](https://leetcode.com/problems/median-employee-salary/) | Hard | [Soln.](../master/Questions_by_ID/569_Median_Employee_Salary.sql) |
| 570 | [Managers with at Least 5 Direct Reports](https://leetcode.com/problems/managers-with-at-least-5-direct-reports/) | Medium | [Soln.](../master/Questions_by_ID/570_Managers_with_at_Least_5_Direct_Reports.sql) |
| 571 | [Find Median Given Frequency of Numbers](https://leetcode.com/problems/find-median-given-frequency-of-numbers/) | Hard | [Soln.](../master/Questions_by_ID/571_Find_Median_Given_Frequency_of_Numbers.sql) |
| 574 | [Winning Candidate](https://leetcode.com/problems/winning-candidate/) | Medium | [Soln.](../master/Questions_by_ID/574_Winning_Candidate.sql) |
| 577 | [Employee Bonus](https://leetcode.com/problems/employee-bonus/) | Easy | [Soln.](../master/Questions_by_ID/577_Employee_Bonus.sql) |
| 578 | [Get Highest Answer Rate Question](https://leetcode.com/problems/get-highest-answer-rate-question/) | Medium | [Soln.](../master/Questions_by_ID/578_Get_Highest_Answer_Rate_Question.sql) | 
| 579 | [Find Cumulative Salary of an Employee](https://leetcode.com/problems/find-cumulative-salary-of-an-employee/) | Hard | [Soln.](../master/Questions_by_ID/579_Find_Cumulative_Salary_of_an_Employee.sql) | 
| 580 | [Count Student Number in Departments](https://leetcode.com/problems/count-student-number-in-departments/) | Medium | [Soln.](../master/Questions_by_ID/580_Count_Student_Number_in_Departments.sql) | 
| 584 | [Find Customer Referee](https://leetcode.com/problems/find-customer-referee/) | Easy | [Soln.](../master/Questions_by_ID/584_Find_Customer_Referee.sql) | 
| 585 | [Investments in 2016](https://leetcode.com/problems/investments-in-2016/) | Medium | [Soln.](../master/Questions_by_ID/585_Investments_in_2016.sql) | 
| 586 | [Customer Placing the Largest Number of Orders](https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/) | Easy | [Soln.](../master/Questions_by_ID/586_Customer_Placing_the_Largest_Number_of_Orders.sql) | 
| 595 | [Big Countries](https://leetcode.com/problems/big-countries/) | Easy | [Soln.](../master/Questions_by_ID/595_Big_Countries.sql) | 
| 596 | [Classes More Than 5 Students](https://leetcode.com/problems/classes-more-than-5-students/) | Easy | [Soln.](../master/Questions_by_ID/596_Classes_More_Than_5_Students.sql) | 
| 597 | [Friend Requests I: Overall Acceptance Rate](https://leetcode.com/problems/friend-requests-i-overall-acceptance-rate/) | Easy | [Soln.](../master/Questions_by_ID/597_Friend_Requests_I_Overall_Acceptance_Rate.sql) | 
| 601 | [Human Traffic of Stadium](https://leetcode.com/problems/human-traffic-of-stadium/) | Hard | [Soln.](../master/Questions_by_ID/601_Human_Traffic_of_Stadium.sql) | 
| 602 | [Friend Requests II: Who Has the Most Friends](https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/) | Medium | [Soln.](../master/Questions_by_ID/602_Friend_Requests_II_Who_Has_the_Most_Friends.sql) | 
| 603 | [Consecutive Available Seats](https://leetcode.com/problems/consecutive-available-seats/) | Easy | [Soln.](../master/Questions_by_ID/603_Consecutive_Available_Seats.sql) | 
| 607 | [Sales Person](https://leetcode.com/problems/sales-person/) | Easy | [Soln.](../master/Questions_by_ID/607_Sales_Person.sql) | 
| 608 | [Tree Node](https://leetcode.com/problems/tree-node/) | Medium | [Soln.](../master/Questions_by_ID/608_Tree_Node.sql) | 
| 610 | [Triangle Judgement](https://leetcode.com/problems/triangle-judgement/) | Easy | [Soln.](../master/Questions_by_ID/610_Triangle_Judgement.sql) | 
| 612 | [Shortest Distance in a Plane](https://leetcode.com/problems/shortest-distance-in-a-plane/) | Medium | [Soln.](../master/Questions_by_ID/612_Shortest_Distance_in_a_Plane.sql) | 
| 613 | [Shortest Distance in a Line](https://leetcode.com/problems/shortest-distance-in-a-line/) | Easy | [Soln.](../master/Questions_by_ID/613_Shortest_Distance_in_a_Line.sql) | 
| 614 | [Second Degree Follower](https://leetcode.com/problems/second-degree-follower/) | Medium | [Soln.](../master/Questions_by_ID/614_Second_Degree_Follower.sql) | 
