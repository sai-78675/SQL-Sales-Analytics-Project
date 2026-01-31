with cte1 as (
    select c.market,c.region,(round(sum(s.sold_quantity*g.gross_price),2)/1000000) as gross_sales_mln from fact_sales_monthly s join
	fact_gross_price g on
	s.product_code=g.product_code and g.fiscal_year=s.fiscal_year
	join dim_customer c on 
		s.customer_code=c.customer_code
	where s.fiscal_year=2021
	group by c.market,c.region
),
cte2 as (
    select 
        *,
        dense_rank() over (partition by region order by gross_sales_mln desc) as drnk
    from cte1
)

select * from cte2 where drnk<=2