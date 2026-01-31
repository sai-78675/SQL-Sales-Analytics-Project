-- Fiscal Year
-- Total Gross Sales amount In that year from Croma

SELECT g.fiscal_year as fiscal_year , round(sum(s.sold_quantity*g.gross_price),2) as Total_gross_sales from fact_sales_monthly s JOIN
fact_gross_price g ON
s.product_code=g.product_code and g.fiscal_year = get_fiscal_year(s.date)
where customer_code=90002002
group by fiscal_year
order by fiscal_year
