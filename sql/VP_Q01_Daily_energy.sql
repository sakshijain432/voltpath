-- session_date ,
-- completed_sessions ,
-- energy_kwh , total_billed ,
-- total_paid

SELECT session_date, 
COUNT_IF(s.status = 'COMPLETED') AS completed_sessions,
SUM(ag.energy_kwh) AS energy_kwh,
SUM(ag.billed_amount) AS total_billed,
SUM(ag.amount_paid) AS total_paid
FROM sj20030614.gold.agg_daily_station ag JOIN sj20030614.gold.fact_sessions s ON ag.station_id = s.station_id
GROUP BY session_date  ORDER BY session_date ASC