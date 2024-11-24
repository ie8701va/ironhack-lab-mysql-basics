SELECT
  *
FROM
  "`BANK`"."PUBLIC"."ACCOUNT"
LIMIT
  10;
  

 
SELECT
  ACCOUNT_ID, DISTRICT_ID
FROM
  "`BANK`"."PUBLIC"."ACCOUNT"
WHERE
  DISTRICT_ID = 1
LIMIT
    5;
	
	
--CONSULTA 2: In the client table, get the id value of the last customer where the district_id is equal to 72."
SELECT
  CLIENT_ID, DISTRICT_ID
FROM
  CLIENT
WHERE
  DISTRICT_ID = 72
ORDER BY
  CLIENT_ID DESC
LIMIT 1;

-- CONSULTA 3, "Get the 3 lowest amounts in the loan table."

SELECT
  AMOUNT
FROM
  LOAN
ORDER BY
  AMOUNT ASC
LIMIT 3;


-- CONSULTA 4: "What are the possible values for status, ordered alphabetically in ascending order in the loan table?"

SELECT DISTINCT
	status
FROM
	loan
ORDER BY 
	status
	
-- CONSULTA 5: "What is the loan_id of the highest payment received in the loan table?"

SELECT
	AMOUNT
FROM
	loan
order BY 
	amount DESC
LIMIT 1;


-- CONSULTA 6: "What is the loan amount for the 5 lowest account_ids in the loan table? Show the account_id and the corresponding amount."

SELECT
	ACCOUNT_ID, AMOUNT
FROM
	loan
ORDER BY 
	AMOUNT ASC
LIMIT 5;

-- CONSULTA 7: "What are the account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?"

SELECT
	ACCOUNT_ID
FROM 
	loan
WHERE 
	duration = 60
order BY 
	AMOUNT ASC
LIMIT 5

-- CONSULTA 8: "What are the unique values of k_symbol in the order table?"

SELECT DISTINCT
    K_SYMBOL
FROM
    ORDERS
	
-- CONSULTA 9: return the order_id values from the order table where the account_id is 34. 

SELECT
	ORDER_ID
from
	ORDERS
where
	ACCOUNT_id = 34
	
-- CONSULTA 10: return the account_id values from the order table where the order_id is between 29540 and 29560, inclusive.

SELECT
	ACCOUNT_ID
FROM 
	ORDERS
WHERE 
	 order_id BETWEEN 29540 AND 29560;

--CONSULTA 11: Return the individual amounts that were sent to the account_to with ID 30067122 in the order table.

SELECT
	AMOUNT
from
	ORDERS
where
	ACCOUNT_ID = 30067122
	
-- CONSULTA 12: "In the trans table, show the trans_id, date, type, and amount of the first 10 transactions of account_id 793 in chronological order, from the most recent to the oldest."

SELECT	
	trans_id, DATE, TYPE, AMOUNT
FROM 
	trans
WHERE 
	ACCOUNT_ID = 793
ORDER BY 
	date DESC
LIMIT 10;

-- CONSULTA 13: In the client table, for all districts with a district_id less than 10, how many clients are there for each district_id? Display the results ordered by district_id in ascending order.

SELECT 
    district_id, 
    COUNT(client_id) AS client_count
FROM 
    client
WHERE 
    district_id < 10
GROUP BY 
    district_id
ORDER BY 
    district_id ASC;

-- CONSULTA 14: In the card table, how many cards exist for each type? Order the result starting with the most frequent type.

SELECT 
    DISTINCT type, 
    COUNT(card_id) AS card_count
FROM 
    card
GROUP BY 
    type
ORDER BY 
    card_count DESC;


-- CONSULTA 15: Using the `loan` table, print the top 10 `account_id`s based on the sum of all of their loan amounts.

SELECT 
    account_id, 
    SUM(amount) AS total_loan_amount
FROM 
    loan
GROUP BY 
    account_id
ORDER BY 
    total_loan_amount DESC
LIMIT 10;


-- CONSULTA 16: In the `loan` table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order.

SELECT
	loan_id, DATE
FROM 
	LOAN
WHERE date < 930907
ORDER BY DATE DESC


-- CONSULTA 17: In the `loan` table, for each day in December 1997, count the number of loans issued for each unique loan duration, ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.


SELECT 
    date,
    duration,
    COUNT(loan_id) AS loan_count
FROM 
    loan
WHERE 
    date BETWEEN 971201 AND 971231
GROUP BY 
    date, duration
ORDER BY 
    date ASC, duration ASC;

-- CONSULTA 18: In the `trans` table, for `account_id` 396, sum the amount of transactions for each type (`VYDAJ` = Outgoing, `PRIJEM` = Incoming).
-- Your output should have the `account_id`, the `type` and the sum of amount, named as `total_amount`. Sort alphabetically by type.

SELECT 
    ACCOUNT_ID, 
    TYPE, 
    SUM(AMOUNT) AS total_amount
FROM 
    trans
WHERE 
    ACCOUNT_ID = 396
GROUP BY 
    ACCOUNT_ID, TYPE
ORDER BY 
    TYPE ASC;