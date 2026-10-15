SELECT
city,
SUM(completed_sessions) AS completed_sessions,
SUM(energy_kwh) AS total_energy_kwh,
SUM(billed_amount) AS total_billed,
ROUND(SUM(completed_sessions) / NULLIF(SUM(completed_sessions) + SUM(failed_sessions), 0) * 100, 2) AS success_rate_pct
FROM sj20030614.gold.agg_daily_station
GROUP BY city