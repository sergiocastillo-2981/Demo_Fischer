- dashboard: general_ca_metrics
  title: General CA Metrics
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  elements:
  - title: Sessions
    name: Sessions
    model: vw_prod_tst
    explore: session
    type: single_value
    fields: [session.count_ca_sessions]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1A73E8"
    single_value_title: Interactions
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: Interactions are sessions opened by a customer and a bot
    listen:
      Brand: session.brand
      Created Date: session.created_date
    row: 0
    col: 0
    width: 3
    height: 3
  - title: Self Service%
    name: Self Service%
    model: vw_prod_tst
    explore: session
    type: single_value
    fields: [session.percent_self_service]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Deflection%
    series_types: {}
    defaults_version: 1
    listen:
      Brand: session.brand
      Created Date: session.created_date
    row: 0
    col: 15
    width: 3
    height: 3
  - title: Self Service
    name: Self Service
    model: vw_prod_tst
    explore: session
    type: single_value
    fields: [session.count_self_service]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#E8710A"
    single_value_title: Deflections
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    note_state: collapsed
    note_display: above
    note_text: Sessions fully served by the bot
    listen:
      Brand: session.brand
      Created Date: session.created_date
    row: 0
    col: 12
    width: 3
    height: 3
  - title: Avg Handle Time By Brand
    name: Avg Handle Time By Brand
    model: vw_prod_tst
    explore: session
    type: looker_grid
    fields: [session.brand, session.avg_ca_handle_time_hms]
    fill_fields: [session.brand]
    filters:
      session.dwf_product: CA
    sorts: [session.avg_ca_handle_time_hms desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      session.avg_ca_handle_time_hms: Avg Handle Time (HH:MM:SS)
    series_cell_visualizations:
      session.avg_ca_handle_time_hms:
        is_active: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Created Date: session.created_date
    row: 3
    col: 0
    width: 9
    height: 6
  - title: Metrics by Day
    name: Metrics by Day
    model: vw_prod_tst
    explore: session
    type: looker_column
    fields: [session.created_date, session.count_ca_sessions, sessionhistory.count_engagements,
      session.count_escalations, session.count_self_service]
    fill_fields: [session.created_date]
    filters:
      session.dwf_product: CA
    sorts: [session.created_date]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_series: []
    series_types: {}
    series_labels:
      session.count_ca_sessions: Interactions
      session.count_escalations_ss: Escalations
      sessionhistory.count_engagements: Engagements
      session.count_escalations: Escalations
      session.count_self_service: Deflections
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    map: usa
    map_projection: ''
    hidden_fields: []
    hidden_points_if_no: []
    up_color: false
    down_color: false
    total_color: false
    listen:
      Brand: session.brand
      Created Date: session.created_date
    row: 3
    col: 9
    width: 9
    height: 6
  - title: Escalations
    name: Escalations
    model: vw_prod_tst
    explore: session
    type: single_value
    fields: [session.count_escalations]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#E52592"
    single_value_title: Escalations
    series_types: {}
    defaults_version: 1
    listen:
      Brand: session.brand
      Created Date: session.created_date
    row: 0
    col: 6
    width: 3
    height: 3
  - title: Escalation%
    name: Escalation%
    model: vw_prod_tst
    explore: session
    type: single_value
    fields: [session.percent_escalations]
    filters: {}
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Brand: session.brand
      Created Date: session.created_date
    row: 0
    col: 9
    width: 3
    height: 3
  - title: Engagements
    name: Engagements
    model: vw_prod_tst
    explore: session
    type: single_value
    fields: [sessionhistory.count_engagements]
    filters:
      session.dwf_product: CA
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#12B5CB"
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Engagements are sessions where the Customer chatted to the bot
    listen:
      Brand: session.brand
      Created Date: session.created_date
    row: 0
    col: 3
    width: 3
    height: 3
  - title: Top 10 URL Sources
    name: Top 10 URL Sources
    model: vw_prod_tst
    explore: session
    type: looker_grid
    fields: [sessionhistory.source_url, session.count_ca_sessions]
    filters:
      session.dwf_product: CA
      sessionhistory.eventtype: sessionCreated
      sessionhistory.source_url: "-NULL,-%ttec%"
    sorts: [session.count_ca_sessions desc]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
        reverse: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      session.count_ca_sessions: "# Sessions"
    series_cell_visualizations:
      session.count_ca_sessions:
        is_active: true
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    show_null_points: true
    listen:
      Created Date: session.created_date
    row: 9
    col: 0
    width: 18
    height: 6
  - title: Top 10 Referrers
    name: Top 10 Referrers
    model: vw_prod_tst
    explore: session
    type: looker_grid
    fields: [sessionhistory.referrer, session.count_ca_sessions]
    filters:
      session.dwf_product: CA
      sessionhistory.eventtype: sessionCreated
      sessionhistory.referrer: "-EMPTY"
      sessionhistory.source_url: "-NULL,-%ttec%"
    sorts: [session.count_ca_sessions desc]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
        reverse: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      session.count_ca_sessions: "# Sessions"
    series_cell_visualizations:
      session.count_ca_sessions:
        is_active: true
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    show_null_points: true
    interpolation: linear
    listen:
      Created Date: session.created_date
    row: 15
    col: 0
    width: 14
    height: 6
  - title: User Returning
    name: User Returning
    model: vw_prod_tst
    explore: session
    type: looker_pie
    fields: [session.count_ca_sessions, sessionhistory.user_returning]
    filters:
      sessionhistory.eventtype: sessionCreated
      session.dwf_product: CA
      sessionhistory.source_url: "-NULL,-%ttec%"
    sorts: [session.count_ca_sessions desc]
    limit: 500
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
        reverse: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    show_null_points: true
    interpolation: linear
    listen:
      Created Date: session.created_date
    row: 15
    col: 14
    width: 4
    height: 6
  - title: Top 10 Intents
    name: Top 10 Intents
    model: vw_prod_tst
    explore: session
    type: looker_wordcloud
    fields: [intentdetails.count_ca_intents, intentdetails.intent]
    filters:
      session.dwf_product: CA
    sorts: [intentdetails.count_ca_intents desc]
    limit: 10
    color_application: undefined
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Created Date: session.created_date
      Brand: session.brand
    row: 21
    col: 0
    width: 18
    height: 4
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: vw_prod_tst
    explore: session
    listens_to_filters: []
    field: session.created_date
