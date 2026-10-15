SELECT 
c.charger_id,
COUNT_IF(s.status = 'COMPLETED') AS completed_sessions,
ks.failed_sessions AS failed_sessions,
(100 - ks.success_rate_pct) AS failure_rate_pct
FROM sj20030614.gold.fact_sessions s JOIN sj20030614.gold.dim_charger c ON s.charger_id = c.charger_id
CROSS JOIN sj20030614.gold.v_kpi_summary ks
GROUP BY c.charger_id, ks.failed_sessions, ks.success_rate_pct

