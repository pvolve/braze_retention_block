- dashboard: daily_retention_graph
  title: Daily Retention Graph
  layout: newspaper
  elements:
  - title: 31-Day Retention
    name: 31-Day Retention
    model: braze_currents_block_customer_behavior
    explore: users_behaviors_app_sessionstart
    type: looker_line
    fields:
    - users_behaviors_app_sessionstart.days_since_first_session
    - users_behaviors_app_firstsession.first_session_date
    - users_behaviors_app_sessionstart.count_distinct_user_id
    pivots:
    - users_behaviors_app_firstsession.first_session_date
    filters:
      users_behaviors_app_sessionstart.days_since_first_session: "[0, 31]"
    sorts:
    - users_behaviors_app_firstsession.first_session_date 0
    - users_behaviors_app_sessionstart.days_since_first_session
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: retention_rate
      label: Retention Rate
      expression: "${users_behaviors_app_sessionstart.count_distinct_user_id}/index(${users_behaviors_app_sessionstart.count_distinct_user_id},\
        \ 1)"
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_labels: {}
    series_types: {}
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    hidden_series: []
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: 2018-09-02 - retention_rate
        name: '2018-09-02'
        axisId: retention_rate
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: ''
    show_x_axis_ticks: true
    x_axis_datetime_label: ''
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    label_value_format: ''
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - users_behaviors_app_sessionstart.count_distinct_user_id
    listen:
      First Session Date: users_behaviors_app_firstsession.first_session_date
    row: 0
    col: 0
    width: 24
    height: 11
  filters:
  - name: First Session Date
    title: First Session Date
    type: field_filter
    default_value: 2018/08/13
    allow_multiple_values: true
    required: false
    model: braze_currents_block_customer_behavior
    explore: users_behaviors_app_sessionstart
    listens_to_filters: []
    field: users_behaviors_app_firstsession.first_session_date
