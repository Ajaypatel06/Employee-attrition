SELECT * FROM employee_attrition.`attrition data`;

use employee_attrition;

select count(*) from attrition_data;

-- 1. Overall Attrition Rate
SELECT (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Overall_Attrition_Rate
FROM attrition_data;

-- 2. Average Tenure of Employees Who Left
SELECT AVG(YearsAtCompany) AS Avg_Tenure_Leaving
FROM attrition_data
WHERE Attrition = 'Yes';

-- 3. Attrition Rate by Department
SELECT Department, 
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Department;

-- 4. Attrition Rate by Job Role
SELECT JobRole, 
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY JobRole;

-- 5. Average Age of Employees Leaving
SELECT AVG(Age) AS Avg_Age_Leaving
FROM attrition_data
WHERE Attrition = 'Yes';

-- 6. Average Monthly Income of Employees Leaving
SELECT AVG(MonthlyIncome) AS Avg_Income_Leaving
FROM attrition_data
WHERE Attrition = 'Yes';

-- 7. Attrition Rate by Gender
SELECT Gender, 
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Gender;

-- 8. Attrition Rate by Marital Status
SELECT MaritalStatus, 
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY MaritalStatus;

-- 9. Attrition Rate by Education Level
SELECT Education, 
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Education;

-- 10. Average Job Satisfaction Score of Employees Leaving
SELECT AVG(JobSatisfaction) AS Avg_Job_Satisfaction_Leaving
FROM attrition_data
WHERE Attrition = 'Yes';

-- 11. Attrition Rate by Business Travel
SELECT BusinessTravel, 
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY BusinessTravel;

-- 12. Average Distance From Home of Employees Leaving
SELECT AVG(DistanceFromHome) AS Avg_Distance_From_Home_Leaving
FROM attrition_data
WHERE Attrition = 'Yes';

-- 13. Attrition Rate by Education Field
SELECT EducationField, 
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY EducationField;

-- 14. Attrition Rate by Job Level
SELECT JobLevel, 
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY JobLevel;

-- 15. Attrition Rate by Stock Option Level
SELECT StockOptionLevel, 
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY StockOptionLevel;

-- 16. Average Performance Rating of Employees Leaving
SELECT AVG(PerformanceRating) AS Avg_Performance_Rating_Leaving
FROM attrition_data
WHERE Attrition = 'Yes';

-- 17. Average Number of Companies Worked for Employees Leaving
SELECT AVG(NumCompaniesWorked) AS Avg_Num_Companies_Leaving
FROM attrition_data
WHERE Attrition = 'Yes';

-- 18. Average Total Working Years for Employees Leaving
SELECT AVG(TotalWorkingYears) AS Avg_Total_Working_Years_Leaving
FROM attrition_data
WHERE Attrition = 'Yes';

-- 19. Attrition Rate by Years Since Last Promotion
SELECT YearsSinceLastPromotion, 
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY YearsSinceLastPromotion;

-- 20. Attrition Rate by Years With Current Manager
SELECT YearsWithCurrManager, 
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY YearsWithCurrManager;

-- 21. Average Attrition Rate by Department and Gender
SELECT Department, Gender, 
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Department, Gender;

-- 22. Average Attrition Rate by Job Role and Age Group
SELECT JobRole, 
       CASE 
           WHEN Age < 30 THEN '<30'
           WHEN Age BETWEEN 30 AND 40 THEN '30-40'
           ELSE '40+'
       END AS Age_Group,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY JobRole, Age_Group;

-- 23. Attrition Rate for Employees with Job Involvement Scores Below 3
SELECT (SUM(CASE WHEN Attrition = 'Yes' AND JobInvolvement < 3 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
WHERE JobInvolvement < 3;

-- 24. Attrition Rate for Employees with Job Involvement Scores of 3 or Higher
SELECT (SUM(CASE WHEN Attrition = 'Yes' AND JobInvolvement >= 3 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
WHERE JobInvolvement >= 3;

-- 25. Average Income for Employees Leaving After Less Than 1 Year
SELECT AVG(MonthlyIncome) AS Avg_Income_Leaving_Under_1Yr
FROM attrition_data
WHERE Attrition = 'Yes' AND YearsAtCompany < 1;

-- 26. Average Income for Employees Leaving After 1-3 Years
SELECT AVG(MonthlyIncome) AS Avg_Income_Leaving_1_3Yrs
FROM attrition_data
WHERE Attrition = 'Yes' AND YearsAtCompany BETWEEN 1 AND 3;

-- 27. Average Income for Employees Leaving After More Than 3 Years
SELECT AVG(MonthlyIncome) AS Avg_Income_Leaving_Above_3Yrs
FROM attrition_data
WHERE Attrition = 'Yes' AND YearsAtCompany > 3;

-- 28. Attrition Rate for Employees with Performance Rating of 4 or Higher
SELECT (SUM(CASE WHEN Attrition = 'Yes' AND PerformanceRating >= 4 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
WHERE PerformanceRating >= 4;

-- 29. Attrition Rate for Employees with Performance Rating Below 4
SELECT (SUM(CASE WHEN Attrition = 'Yes' AND PerformanceRating < 4 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
WHERE PerformanceRating < 4;

-- 30. Attrition Rate by Business Travel Frequency (Travel_Rarely vs. Travel_Frequently)
SELECT BusinessTravel,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
WHERE BusinessTravel IN ('Travel_Rarely', 'Travel_Frequently')
GROUP BY BusinessTravel;

-- 31. Attrition Rate by Distance From Home (Above 10 km vs. Below 10 km)
SELECT CASE 
           WHEN DistanceFromHome > 10 THEN 'Above 10 km'
           ELSE 'Below 10 km'
       END AS Distance_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Distance_Category;

-- 32. Attrition Rate for Employees with High Stock Options
SELECT (SUM(CASE WHEN Attrition = 'Yes' AND StockOptionLevel = 3 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
WHERE StockOptionLevel = 3;

-- 33. Attrition Rate for Employees with Low Stock Options
SELECT (SUM(CASE WHEN Attrition = 'Yes' AND StockOptionLevel < 3 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
WHERE StockOptionLevel < 3;

-- 34. Average Attrition Rate by Years At Company
SELECT YearsAtCompany,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY YearsAtCompany;

-- 35. Average Attrition Rate by Distance From Home and Job Role
SELECT JobRole, 
       CASE 
           WHEN DistanceFromHome > 10 THEN 'Above 10 km'
           ELSE 'Below 10 km'
       END AS Distance_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY JobRole, Distance_Category;

-- 36. Attrition Rate by Training Times Last Year
SELECT TrainingTimesLastYear, 
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY TrainingTimesLastYear;

-- 37. Attrition Rate by Performance Rating and Job Satisfaction
SELECT JobSatisfaction, PerformanceRating,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY JobSatisfaction, PerformanceRating;

-- 38. Attrition Rate by Environment Satisfaction and Work-Life Balance
SELECT EnvironmentSatisfaction, WorkLifeBalance,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY EnvironmentSatisfaction, WorkLifeBalance;

-- 39. Average Attrition Rate by Job Involvement and Education
SELECT JobInvolvement, Education,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY JobInvolvement, Education;

-- 40. Average Attrition Rate by Number of Companies Worked and Distance From Home
SELECT NumCompaniesWorked, 
       CASE 
           WHEN DistanceFromHome > 10 THEN 'Above 10 km'
           ELSE 'Below 10 km'
       END AS Distance_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY NumCompaniesWorked, Distance_Category;

-- 41. Attrition Rate by Job Role and Education Field
SELECT JobRole, EducationField,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY JobRole, EducationField;

-- 42. Attrition Rate by Age Group and Job Satisfaction
SELECT CASE 
           WHEN Age < 30 THEN '<30'
           WHEN Age BETWEEN 30 AND 40 THEN '30-40'
           ELSE '40+'
       END AS Age_Group, JobSatisfaction,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Age_Group, JobSatisfaction;

-- 43. Average Attrition Rate by Job Role and Business Travel
SELECT JobRole, BusinessTravel,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY JobRole, BusinessTravel;

-- 44. Attrition Rate by Years With Current Manager and Job Satisfaction
SELECT YearsWithCurrManager, JobSatisfaction,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY YearsWithCurrManager, JobSatisfaction;

-- 45. Attrition Rate for Employees with High vs. Low Training Times Last Year
SELECT CASE 
           WHEN TrainingTimesLastYear > 2 THEN 'High'
           ELSE 'Low'
       END AS Training_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Training_Category;

-- 46. Average Attrition Rate by Education Level and Marital Status
SELECT Education, MaritalStatus,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Education, MaritalStatus;

-- 47. Attrition Rate by Performance Rating and Distance From Home
SELECT PerformanceRating,
       CASE 
           WHEN DistanceFromHome > 10 THEN 'Above 10 km'
           ELSE 'Below 10 km'
       END AS Distance_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY PerformanceRating, Distance_Category;

-- 48. Attrition Rate by Age Group and Work-Life Balance
SELECT CASE 
           WHEN Age < 30 THEN '<30'
           WHEN Age BETWEEN 30 AND 40 THEN '30-40'
           ELSE '40+'
       END AS Age_Group, WorkLifeBalance,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Age_Group, WorkLifeBalance;

-- 49. Attrition Rate by Years At Company and Job Involvement
SELECT YearsAtCompany, JobInvolvement,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY YearsAtCompany, JobInvolvement;

-- 50. Attrition Rate by Job Role and Age Group
SELECT JobRole,
       CASE 
           WHEN Age < 30 THEN '<30'
           WHEN Age BETWEEN 30 AND 40 THEN '30-40'
           ELSE '40+'
       END AS Age_Group,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY JobRole, Age_Group;

-- 51. Attrition Rate by Job Role and Total Working Years
SELECT JobRole, 
       CASE 
           WHEN TotalWorkingYears < 5 THEN '<5 Years'
           WHEN TotalWorkingYears BETWEEN 5 AND 10 THEN '5-10 Years'
           ELSE '10+ Years'
       END AS Working_Years_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY JobRole, Working_Years_Category;

-- 52. Attrition Rate by Department and Job Level
SELECT Department, JobLevel, 
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Department, JobLevel;

-- 53. Attrition Rate by Marital Status and Job Role
SELECT MaritalStatus, JobRole,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY MaritalStatus, JobRole;

-- 54. Attrition Rate by Gender and Education Level
SELECT Gender, Education,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Gender, Education;

-- 55. Average Job Satisfaction by Department
SELECT Department, AVG(JobSatisfaction) AS Avg_Job_Satisfaction
FROM attrition_data
GROUP BY Department;

-- 56. Average Environment Satisfaction by Job Role
SELECT JobRole, AVG(EnvironmentSatisfaction) AS Avg_Environment_Satisfaction
FROM attrition_data
GROUP BY JobRole;

-- 57. Attrition Rate by Age Group and Job Role Tenure
SELECT JobRole, 
       CASE 
           WHEN Age < 30 THEN '<30'
           WHEN Age BETWEEN 30 AND 40 THEN '30-40'
           ELSE '40+'
       END AS Age_Group,
       CASE 
           WHEN YearsAtCompany < 3 THEN '<3 Years'
           WHEN YearsAtCompany BETWEEN 3 AND 5 THEN '3-5 Years'
           ELSE '5+ Years'
       END AS Tenure_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY JobRole, Age_Group, Tenure_Category;

-- 58. Attrition Rate by Distance From Home and Job Involvement
SELECT JobInvolvement,
       CASE 
           WHEN DistanceFromHome > 10 THEN 'Above 10 km'
           ELSE 'Below 10 km'
       END AS Distance_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY JobInvolvement, Distance_Category;

-- 59. Attrition Rate by Training Times Last Year and Performance Rating
SELECT TrainingTimesLastYear, PerformanceRating,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY TrainingTimesLastYear, PerformanceRating;

-- 60. Attrition Rate by Stock Option Level and Job Satisfaction
SELECT StockOptionLevel, JobSatisfaction,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY StockOptionLevel, JobSatisfaction;

-- 61. Average Monthly Income by Education Level
SELECT Education, AVG(MonthlyIncome) AS Avg_Monthly_Income
FROM attrition_data
GROUP BY Education;

-- 62. Attrition Rate by Education Level and Work-Life Balance
SELECT Education, WorkLifeBalance,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Education, WorkLifeBalance;

-- 63. Attrition Rate by Performance Rating and Years Since Last Promotion
SELECT PerformanceRating, YearsSinceLastPromotion,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY PerformanceRating, YearsSinceLastPromotion;

-- 64. Attrition Rate by Job Satisfaction and Distance From Home
SELECT JobSatisfaction,
       CASE 
           WHEN DistanceFromHome > 10 THEN 'Above 10 km'
           ELSE 'Below 10 km'
       END AS Distance_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY JobSatisfaction, Distance_Category;

-- 65. Average Attrition Rate by Gender and Business Travel
SELECT Gender, BusinessTravel,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Gender, BusinessTravel;

-- 66. Attrition Rate by Department and Age Group
SELECT Department,
       CASE 
           WHEN Age < 30 THEN '<30'
           WHEN Age BETWEEN 30 AND 40 THEN '30-40'
           ELSE '40+'
       END AS Age_Group,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Department, Age_Group;

-- 67. Average Attrition Rate by Job Role and Performance Rating
SELECT JobRole, PerformanceRating,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY JobRole, PerformanceRating;

-- 68. Attrition Rate by Marital Status and Total Working Years
SELECT MaritalStatus,
       CASE 
           WHEN TotalWorkingYears < 5 THEN '<5 Years'
           WHEN TotalWorkingYears BETWEEN 5 AND 10 THEN '5-10 Years'
           ELSE '10+ Years'
       END AS Working_Years_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY MaritalStatus, Working_Years_Category;

-- 69. Attrition Rate by Department and Years Since Last Promotion
SELECT Department, YearsSinceLastPromotion,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Department, YearsSinceLastPromotion;

-- 70. Attrition Rate by Gender and Number of Companies Worked
SELECT Gender, NumCompaniesWorked,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Gender, NumCompaniesWorked;

-- 71. Attrition Rate by Education Level and Total Working Years
SELECT Education,
       CASE 
           WHEN TotalWorkingYears < 5 THEN '<5 Years'
           WHEN TotalWorkingYears BETWEEN 5 AND 10 THEN '5-10 Years'
           ELSE '10+ Years'
       END AS Working_Years_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Education, Working_Years_Category;

-- 72. Average Attrition Rate by Job Role and Training Times Last Year
SELECT JobRole, TrainingTimesLastYear,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY JobRole, TrainingTimesLastYear;

-- 73. Attrition Rate by Distance From Home and Stock Option Level
SELECT DistanceFromHome,
       CASE 
           WHEN StockOptionLevel = 3 THEN 'High'
           ELSE 'Low'
       END AS Stock_Option_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY DistanceFromHome, Stock_Option_Category;

-- 74. Attrition Rate by Job Satisfaction and Years With Current Manager
SELECT JobSatisfaction, YearsWithCurrManager,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY JobSatisfaction, YearsWithCurrManager;

-- 75. Attrition Rate by Performance Rating and Distance From Home
SELECT PerformanceRating,
       CASE 
           WHEN DistanceFromHome > 10 THEN 'Above 10 km'
           ELSE 'Below 10 km'
       END AS Distance_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY PerformanceRating, Distance_Category;

-- 76. Attrition Rate by Training Times Last Year and Job Role
SELECT TrainingTimesLastYear, JobRole,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY TrainingTimesLastYear, JobRole;

-- 77. Attrition Rate by Department and Education Level
SELECT Department, Education,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Department, Education;

-- 78. Attrition Rate by Age Group and Performance Rating
SELECT CASE 
           WHEN Age < 30 THEN '<30'
           WHEN Age BETWEEN 30 AND 40 THEN '30-40'
           ELSE '40+'
       END AS Age_Group, PerformanceRating,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Age_Group, PerformanceRating;

-- 79. Attrition Rate by Job Role and Business Travel Frequency
SELECT JobRole,
       CASE 
           WHEN BusinessTravel = 'Travel_Rarely' THEN 'Rarely'
           WHEN BusinessTravel = 'Travel_Frequently' THEN 'Frequently'
           ELSE 'Non-Travel'
       END AS Travel_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY JobRole, Travel_Category;

-- 80. Average Attrition Rate by Department and Work-Life Balance
SELECT Department, WorkLifeBalance,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Department, WorkLifeBalance;

-- 81. Attrition Rate by Gender and Job Involvement
SELECT Gender, JobInvolvement,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Gender, JobInvolvement;

-- 82. Attrition Rate by Job Role and Environment Satisfaction
SELECT JobRole, EnvironmentSatisfaction,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY JobRole, EnvironmentSatisfaction;

-- 83. Attrition Rate by Department and Job Role Tenure
SELECT Department,
       CASE 
           WHEN JobRole IN ('Manager', 'Senior Manager') THEN 'Senior'
           ELSE 'Junior'
       END AS Role_Tenure_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Department, Role_Tenure_Category;

-- 84. Attrition Rate by Age Group and Job Role
SELECT CASE 
           WHEN Age < 30 THEN '<30'
           WHEN Age BETWEEN 30 AND 40 THEN '30-40'
           ELSE '40+'
       END AS Age_Group, JobRole,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Age_Group, JobRole;

-- 85. Attrition Rate by Education Level and Number of Companies Worked
SELECT Education,
       CASE 
           WHEN NumCompaniesWorked < 3 THEN '<3 Companies'
           WHEN NumCompaniesWorked BETWEEN 3 AND 6 THEN '3-6 Companies'
           ELSE '7+ Companies'
       END AS Companies_Worked_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Education, Companies_Worked_Category;

-- 86. Average Attrition Rate by Business Travel Frequency and Job Involvement
SELECT BusinessTravel,
       CASE 
           WHEN JobInvolvement = 'Low' THEN 'Low Involvement'
           ELSE 'High Involvement'
       END AS Job_Involvement_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY BusinessTravel, Job_Involvement_Category;

-- 87. Attrition Rate by Years Since Last Promotion and Education Level
SELECT YearsSinceLastPromotion, Education,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY YearsSinceLastPromotion, Education;

-- 88. Attrition Rate by Total Working Years and Job Satisfaction
SELECT TotalWorkingYears, JobSatisfaction,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY TotalWorkingYears, JobSatisfaction;

-- 89. Attrition Rate by Distance From Home and Training Times Last Year
SELECT DistanceFromHome, TrainingTimesLastYear,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY DistanceFromHome, TrainingTimesLastYear;

-- 90. Average Attrition Rate by Gender and Job Satisfaction
SELECT Gender, AVG(JobSatisfaction) AS Avg_Job_Satisfaction
FROM attrition_data
GROUP BY Gender;

-- 91. Attrition Rate by Department and Job Role Tenure
SELECT Department,
       CASE 
           WHEN JobRole IN ('Junior', 'Senior') THEN 'Junior/Senior'
           ELSE 'Others'
       END AS Role_Tenure_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Department, Role_Tenure_Category;

-- 92. Attrition Rate by Department and Performance Rating
SELECT Department, PerformanceRating,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Department, PerformanceRating;

-- 93. Attrition Rate by Job Role and Total Working Years
SELECT JobRole, 
       CASE 
           WHEN TotalWorkingYears < 5 THEN '<5 Years'
           WHEN TotalWorkingYears BETWEEN 5 AND 10 THEN '5-10 Years'
           ELSE '10+ Years'
       END AS Working_Years_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY JobRole, Working_Years_Category;

-- 94. Attrition Rate by Gender and Environment Satisfaction
SELECT Gender, EnvironmentSatisfaction,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Gender, EnvironmentSatisfaction;

-- 95. Attrition Rate by Age Group and Job Role Tenure
SELECT CASE 
           WHEN Age < 30 THEN '<30'
           WHEN Age BETWEEN 30 AND 40 THEN '30-40'
           ELSE '40+'
       END AS Age_Group,
       CASE 
           WHEN JobRole IN ('Manager', 'Senior Manager') THEN 'Senior'
           ELSE 'Junior'
       END AS Role_Tenure_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Age_Group, Role_Tenure_Category;

-- 96. Attrition Rate by Job Role and Absences
SELECT JobRole,
       CASE 
           WHEN Absences < 5 THEN 'Low Absences'
           WHEN Absences BETWEEN 5 AND 10 THEN 'Moderate Absences'
           ELSE 'High Absences'
       END AS Absence_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY JobRole, Absence_Category;

-- 97. Attrition Rate by Department and Training Times Last Year
SELECT Department, TrainingTimesLastYear,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Department, TrainingTimesLastYear;

-- 98. Attrition Rate by Gender and Job Involvement
SELECT Gender, JobInvolvement,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Gender, JobInvolvement;

-- 99. Attrition Rate by Department and Distance From Home
SELECT Department,
       CASE 
           WHEN DistanceFromHome > 10 THEN 'Above 10 km'
           ELSE 'Below 10 km'
       END AS Distance_Category,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Department, Distance_Category;

-- 100. Attrition Rate by Education Level and Job Role
SELECT Education, JobRole,
       (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS Attrition_Rate
FROM attrition_data
GROUP BY Education, JobRole;

