-- query 1
select client_id from client
where district_id = 1
limit 5;

-- query 2
select client_id from client
where district_id = 72
order by client_id desc
limit 1;

-- query 3
select amount from loan
order by amount asc
limit 3;

-- query 4
select distinct status from loan
order by status asc;

-- quert 5
select loan_id from loan
order by payments desc
limit 1;

-- query 6
select account_id, amount from loan
order by account_id asc
limit 5;

-- query 7
select account_id from loan 
where duration = 60
order by amount
limit 5;

-- query 8 
select distinct k_symbol from `order` 
order by k_symbol asc;

-- query 9
select order_id from `order`
where account_id = '34';

-- query 10
select account_id from `order` 
where order_id between 29540 and 29561
limit 4;

-- query 11
select amount from `order` 
where account_to = 30067122;



-- query 12

select trans_id, date, type, amount from trans
where account_id = 793 order by date desc;

-- query 13
select district_id, count(*) as client_count
from client
where district_id < 10
group by district_id
order by district_id asc;

-- query 14

select type, COUNT(*) as `n_of_type`
from card
group by  type
order by `n_of_type` desc;

-- query 15
select account_id, sum(amount) as sum_loan
from loan
group by account_id
order by sum_loan desc
limit 10;

-- query 16
select date, count(*) as number_loans
from loan
where date < '930907'
group by date
order by date desc
limit 5;

-- query 17 
select date, duration, count(*) as n_loans
from loan
where date like '9712%'
group by date, duration
order by date asc, duration asc;

-- query 18 
select account_id, type, sum(amount) as total_amount
from trans
where account_id = 396
group by account_id, type
order by type asc;

-- query 19
select account_id,
    case type
        when 'PRIJEM' then 'INCOMING'
        when 'VYDAJ' then 'OUTCOMING'
        else type
    end as transaction_type,
    floor(sum(amount)) as total_amount
from trans
where account_id = 396
group by account_id, transaction_type
order by transaction_type asc;


-- query 20
select
    account_id,
    round(sum(case when type = 'PRIJEM' then amount else 0 end),0) as incoming_amount,
    round(sum(case when type = 'VYDAJ' then amount else 0 end), 0) as outgoing_amount,
    round(sum(case when type = 'PRIJEM' then amount else -amount end), 0) as difference
from
    trans
where
    account_id = 396
    and type in ('VYDAJ', 'PRIJEM')
group by
    account_id;


-- query 21
select
    account_id,
     round(SUM(CASE WHEN type = 'PRIJEM' THEN amount ELSE 0 END) - SUM(CASE WHEN type = 'VYDAJ' THEN amount ELSE 0 END),0) AS difference
from
    trans
group by
    account_id
order by difference desc
limit 10;