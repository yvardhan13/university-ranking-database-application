/* a. What are all universities, programs and their ranks by the agencies order by Program Name, Agency and ranks? */
Select uName, aName, pName,rank
From University u, Program p, Agency a, Rank r
Where u.uId = r.uId and p.pId = r.pId and a.aId = r.aId
Order by pName, aName, rank;


/*b. What are all universities in California?*/
Select uName
From University u, State s
Where u.sName = s.sName and s.sName = 'California';


/*c. Which universities require average GMAT that is equal to or greater than 700 for their MBA program?*/
Select uName, avgGMAT
From University u, Program p, ProgramStats s
Where u.uId = s.uId and p.pId = s.pId and pName = 'MBA' and avgGMAT > 700
Order by avgGMAT ASC;


/*d. Whether the programs are qualified for STEM qualified or not and what are the OPT length for each kind of program?*/
Select pName, p.stem, optLength
From Program p, Stem s
Where p.stem = s.stem;


/*e. What is the Rank of MBA program of Northwestern university in different agencies in 2016?*/
Select uName,pName, aName, rank
From Program p, University u, Agency a, Rank r
Where u.uId = r.uId and p.pId = r.pId and a.aId = r.aId 
And p.pName = 'MBA' 
And u.uName = 'Northwestern university'
And r.year=2016;


/*f. What are the agencies that have been rating universities since 2000?*/
Select aName, rankingSince
From Agency
Where rankingSince <= 2000;




/*g. What are the universities in California that are offering MSBA program in alphabetical order?*/
SELECT uName 
FROM University U JOIN ProgramStats PS ON U.uId= PS.uId 
WHERE pId='002' AND sName='California' ORDER BY uName;




/*h. What is the average GMAT of top 10 Universities in MSIS program rated by US News in 2016?*/
SELECT AVG(avgGMAT) AS 'Average GMAT' 
FROM ProgramStats PS JOIN Rank R ON PS.pId=R.pId 
WHERE aId='1001' AND rank <= 10 AND R.year=2016;


/*I. What is the distinct length of MSIS programs across universities?*/
SELECT DISTINCT length 
FROM ProgramStats 
WHERE pId='001';


/*j.What is the cheapest tuition among the top 10 universities (ranked by US News) in MS IS in 2016?*/
SELECT MIN(tuition) AS 'Minimum Tution' 
FROM ProgramStats PS JOIN Rank R ON PS.pId=R.pId 
					 JOIN Agency A ON R.aId=A.aId 
WHERE PS.pId='001' AND rank <= 10 AND A.aID='1001' AND R.year=2016;


/*k. What  are the top 10 Universities ranked by US News for MBA in 2016?*/
SELECT uName, rank
FROM University U JOIN Rank R ON U.uId= R.uId JOIN Agency A ON R.aId=A.aId 
WHERE pId='003' AND rank<=10 AND A.aId='1001' AND R.year = 2016;
