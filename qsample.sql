SELECT yb_query_diagnostics(
    query_id => 9060892899833083638,
    explain_sample_rate => 20,
    diagnostics_interval_sec => 120,
    explain_analyze => false,
    explain_dist => false,
    bind_var_query_min_duration_ms => 5
    );

SELECT yb_query_diagnostics(
    query_id => 1673998594963869560,
    explain_sample_rate => 20,
    diagnostics_interval_sec => 120,
    explain_analyze => false,
    explain_dist => false,
    bind_var_query_min_duration_ms => 5
    );

SELECT yb_query_diagnostics(
    query_id => 6850207142802796653,
    explain_sample_rate => 100,
    diagnostics_interval_sec => 300,
    explain_analyze => false,
    explain_dist => false,
    bind_var_query_min_duration_ms => 5
    );

