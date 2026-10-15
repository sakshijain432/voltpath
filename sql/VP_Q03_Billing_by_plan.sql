SELECT plan_at_session,
COUNT_IF(s.status = 'COMPLETED') AS completed_sessions,
kps.mismatch_sessions AS mismatch_sessions,
kps.revenue_leakage AS revenue_leakage
FROM sj20030614.gold.fact_sessions s CROSS JOIN sj20030614.gold.v_kpi_summary kps 
GROUP BY plan_at_session, kps.mismatch_sessions, kps.revenue_leakage
ORDER BY plan_at_session