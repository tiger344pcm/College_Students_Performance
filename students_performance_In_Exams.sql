-- An EDA Project Analysis from   MySQL
-- Here are some practice questions you can use to query this dataset . 
-- The questions cover a range of SQL concepts, from basic filtering to more complex aggregations.
 
 -- Table name is 'Students_per'
 
alter table students_per rename column `ï»¿gender` to gender;
 
-- Basic Questions:-(SELECT ,WHERE ,ORDER BY) 
-- 1. Count the total number of students.
SELECT 
    COUNT(*) AS Total_number_of_students
FROM
    students_per;

-- 2. Find all female students who have bachelors's degree as thier parental level of education.
SELECT 
    COUNT(gender) AS NO_Female_with_Bachelor_degree
FROM
    students_per
WHERE
    gender = 'female'
        AND parental_level_of_education = 'bachelor\'s degree';
        
-- 3. List all students whose math score is greater than 90, ordered by thier math score in descending order
SELECT 
    *
FROM
    students_per
WHERE
    math_score > 90
ORDER BY math_score DESC; 

-- 4. Find the average reading score for students who completed thier test preparations course.
SELECT 
    test_preparation_course,
    AVG(reading_score) AS Avg_Reading_Students
FROM
    students_per
GROUP BY test_preparation_course;  

-- Intermediate Questions (GROUP BY ,HAVING, AGGREGATION FUNCTIONS)
-- questions 5 . Calculate the averagmath reading and writing scores for each gender
SELECT 
    GENDER,
    ROUND(AVG(math_score), 2) AS Avg_Math_Score,
    ROUND(AVG(writing_score), 2) AS Avg_Writing_Score
FROM
    students_per
GROUP BY GENDER;

-- question 6. find the number of students in each race/ethnicity group
SELECT 
    race_or_ethnicity, COUNT(gender)
FROM
    students_per
GROUP BY race_or_ethnicity;

-- questions 7. Determine the maximum writing score for each parental level of education.
SELECT 
    parental_level_of_education,
    MAX(writing_score) AS Maximum_writing_score
FROM
    students_per
GROUP BY parental_level_of_education;

-- questions 8. List all parental_level_of_education groups that have an average math score is greater than 75
SELECT 
    parental_level_of_education,
    AVG(math_score) AS Avg_Math_Score
FROM
    students_per
GROUP BY parental_level_of_education
HAVING Avg_Math_Score > 75;

-- Advanced Questions( SUBQUERIES< JOINS -if )
-- question 9. Find all students whose math score is higher than the average math score of all students.
SELECT 
    *
FROM
    students_per
WHERE
    math_score > (SELECT 
            AVG(math_score)
        FROM
            students_per);
            
-- Questions 10. Rank students by thier reading score in descending order.
SELECT * ,
 DENSE_RANK()OVER(ORDER BY reading_score DESC)as Reading_rank_desc
FROM students_per; 


-- Conclusion

-- This MySQL project successfully delivers a clear, well-structured EDA using SQL,
--  covering a wide range of query types from basic filtering to advanced analytics. 
-- The progression from simple counts to subqueries and ranking illustrates both foundational 
-- competence and analytical thinking. While minor polishing in comments and naming 
-- could further improve professionalism, the work is a strong example of practical SQL application for data analysis.
           