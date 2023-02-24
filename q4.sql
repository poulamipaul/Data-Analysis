--What is the name of the most expensive item purchased?

SELECT receipt_item.DESCRIPTION, receipt_item.TOTAL_FINAL_PRICE
FROM receipt_item
WHERE receipt_item.TOTAL_FINAL_PRICE = (
  SELECT MAX(TOTAL_FINAL_PRICE)
  FROM receipt_item
)
LIMIT 1;
