--Which user spent the most money in the month of August?
select ID,max(TOTAL_SPENT) as TOTAL_SPENT from
(SELECT user.ID, SUM(RECEIPT.TOTAL_SPENT) AS TOTAL_SPENT
FROM user
JOIN RECEIPT ON user.ID = RECEIPT.USER_ID
WHERE RECEIPT.PURCHASE_DATE like '%-08-%'
GROUP BY user.ID);