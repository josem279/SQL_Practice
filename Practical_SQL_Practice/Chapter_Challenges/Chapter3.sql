-- Chapter 3: Understanding Data Types
-- Challenge Queries


/* 
Question 1: Your company delivers fruit and vegetables to local grocery stores, and you need to track the mileaage driven by each driver each day to a tenth of
a mile. Assuming no driver would ever travel more that 999 miles in a day, what would be an appropriate data type for the mileage column in your table.
Why?

Answer 1: Assuming we would only need to track to the nearest tenth of a mile and drivers never drive more than 999 miles, we would want a data type 
that reflects 4 significant figures. I would choose to use the NUMERIC data type with a precision of 4 and a scale of 1.

Question 2: In the table listing each driver in your company, what are appropriate data types for the drivers' first and last names? Why is it a
good idea to separate firs and last names into two columns rather than having one larger name column?

Answer 2: I would choose the VARCHAR data type for the first and last name columns in my table with an ample amount of characters to suit the two
fields - (15) and (30) respectively. This data type is best for minimizing space as it can go up to the indicated character count but if a first or
last name does not have that many characters, the program will not pad/fill in the remaining values. It is not adviseable to combine both first and 
last names into one field for the purpose of saving space - the combined field may need to house extra characters like a space or comma to distinguish
the two values - and because a combined field may make future queries harder to perform.

Question 3: Assume you have a text column that includes strings formatted as dates. One of the strings is written as '4//2017'. What will happen when
you try to convert that string to the timestamp data type?

Answer 3: An ERROR message should pop up when trying to convert the text '4//2017' in to a TIMESTAMP as it is lacking the months and is not written
in the format required by the TIMESTAMP data type - 'YYYY-MM-DD HH:MM:SS'.