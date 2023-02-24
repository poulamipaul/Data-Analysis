-- Which brand saw the most dollars spent in the month of June?

select name,max(Total_Spent_June) from
(select brand.NAME,sum(TOTAL_SPENT ) as Total_Spent_June
from brand join receipt_item on brand.barcode=receipt_item.barcode and brand.brand_code=receipt_item.brand_code
join receipt on receipt_item.REWARDS_RECEIPT_ID=receipt.ID
where receipt.PURCHASE_DATE like '%-06-%'
group by brand.NAME);