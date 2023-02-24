--How many users scanned in each month?
SELECT COUNT(DISTINCT receipts.USER_ID) AS USER_COUNT, strftime('%Y-%m', receipts.DATE_SCANNED) AS MONTH
FROM receipts
GROUP BY MONTH;