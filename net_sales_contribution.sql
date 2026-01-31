with cte1 as (SELECT c.customer,round(sum(net_sales)/1000000,2) as net_sales_mln FROM gdb0041.net_sales n
join dim_customer c 
	on n.customer_code=c.customer_code
where fiscal_year=2021
group by c.customer)

select 
    *,
    net_sales_mln*100/sum(net_sales_mln) over () as pct_share_overall
from cte1
order by net_sales_mln desc;
