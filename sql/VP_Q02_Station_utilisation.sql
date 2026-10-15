SELECT s.station_id, 
ag.city AS city, 
COUNT_IF(s.status = 'COMPLETED') AS completed_sessions,
SUM(s.energy_kwh) AS energy_kwh,
SUM(ag.utilisation_pct) AS utilisation_pct
FROM sj20030614.gold.fact_sessions as s JOIN sj20030614.gold.agg_daily_station as ag USING (station_id)
GROUP BY s.station_id, ag.city, ag.utilisation_pct
ORDER BY utilisation_pct
