use bank ;

with rolling_fraud as ( SELECT nameorig,step, 
SUM(isfraud) OVER (PARTITION BY nameOrig order by STEP ROWS BETWEEN 4 PRECEDING and CURRENT ROW ) as fraud_rolling
FROM transactions)

SELECT * FROM rolling_fraud
WHERE fraud_rolling > 0 ;
