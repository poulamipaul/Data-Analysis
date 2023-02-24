--What user bought the most expensive item?
SELECT receipt.USER_ID, receipt_item.TOTAL_FINAL_PRICE
FROM receipt_item
JOIN receipt ON receipt_item.REWARDS_RECEIPT_ID = receipt.ID
WHERE receipt_item.TOTAL_FINAL_PRICE = (
  SELECT MAX(receipt_item.TOTAL_FINAL_PRICE)
  FROM receipt_item
)
ORDER BY receipt_item.TOTAL_FINAL_PRICE DESC
LIMIT 1;
