- dashboard: base
  title: "Executive Summary Report"
  layout: newspaper
  description: ''
  query_timezone: user_timezone
  embed_style:
    background_color: "#f6f8fa"
    show_title: true
    title_color: "#3a4245"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    tile_separator_color: "#bdb7b7"
    tile_border_radius: 2
    show_tile_shadow: false
    text_tile_text_color: ''
  elements:
  - name: "<strong>Executive Summary Report<strong>"
    type: text
    title_text: "<strong>Executive Summary Report<strong>"
    body_text: ''
    # row: 0
    col: 10
    width: 13
    height: 2
  - name: 'solarwindsimge'
    type: text
    title_text: <img height="50px" src="https://www.baincapitalventures.com/assets/solarwinds.png"></img>
    # row: 0
    col: 1
    width: 9
    height: 2
  - title: Number of First Purchasers
    name: Number of First Purchasers
    model: thelook
    explore: order_items
    type: single_value
    fields:
    - order_items.first_purchase_count
    filters: {}
    sorts:
    - order_items.first_purchase_count desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: goal
      label: Goal
      expression: '10000'
      value_format:
      value_format_name: decimal_0
    query_timezone: America/Los_Angeles
    font_size: medium
    colors:
    - "#5245ed"
    - "#a2dcf3"
    - "#776fdf"
    - "#1ea8df"
    - "#49cec1"
    - "#776fdf"
    - "#49cec1"
    - "#1ea8df"
    - "#a2dcf3"
    - "#776fdf"
    - "#776fdf"
    - "#635189"
    text_color: black
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: New Users Acquired
    custom_color_enabled: false
    custom_color: forestgreen
    hidden_fields: []
    y_axes: []
    listen:
      Date: order_items.created_date
      State: users.state
      City: users.city
    note_state: collapsed
    note_display: above
    note_text: ''
    # row: 2
    col: 1
    width: 8
    height: 4
  - title: Total Order Count
    name: Total Order Count
    model: thelook
    explore: order_items
    type: single_value
    fields:
    - order_items.reporting_period
    - order_items.count
    filters:
      order_items.reporting_period: "-NULL"
    sorts:
    - order_items.count desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: percent_change
      label: Percent Change
      expression: "${order_items.count}/offset(${order_items.count},1) - 1"
      value_format:
      value_format_name: percent_0
    query_timezone: America/Los_Angeles
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    colors:
    - "#5245ed"
    - "#a2dcf3"
    - "#776fdf"
    - "#1ea8df"
    - "#49cec1"
    - "#776fdf"
    - "#49cec1"
    - "#1ea8df"
    - "#a2dcf3"
    - "#776fdf"
    - "#776fdf"
    - "#635189"
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_single_value_title: true
    single_value_title: Orders This Year
    hidden_fields:
    - order_items.reporting_period
    comparison_label: vs Same Period Last Year
    custom_color_enabled: false
    custom_color: forestgreen
    y_axes: []
    listen:
      State: users.state
      City: users.city
    note_state: collapsed
    note_display: below
    note_text: ''
    # row: 2
    col: 15
    width: 8
    height: 4
  - title: 30 Day Repeat Purchase Rate
    name: 30 Day Repeat Purchase Rate
    model: thelook
    explore: order_items
    type: single_value
    fields:
    - order_items.30_day_repeat_purchase_rate
    filters:
      users.country: "{{ _user_attributes['country'] }}"
    sorts:
    - repeat_purchase_facts.30_day_repeat_purchase_rate desc
    - order_items.30_day_repeat_purchase_rate desc
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    font_size: medium
    text_color: black
    colors:
    - "#1f78b4"
    - "#a6cee3"
    - "#33a02c"
    - "#b2df8a"
    - "#e31a1c"
    - "#fb9a99"
    - "#ff7f00"
    - "#fdbf6f"
    - "#6a3d9a"
    - "#cab2d6"
    - "#b15928"
    - "#edbc0e"
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Repeat Purchase Rate
    hidden_fields: []
    y_axes: []
    listen:
      Date: order_items.created_date
    note_state: collapsed
    note_display: hover
    note_text: What percent of orders are followed by a repeat purchase by the same
      user within 30 days?
    # row: 2
    col: 9
    width: 6
    height: 4
  - title: Total Sales, Year over Year
    name: Total Sales, Year over Year
    model: thelook
    explore: order_items
    type: looker_line
    fields:
    - order_items.created_year
    - order_items.created_month_num
    - order_items.total_sale_price
    pivots:
    - order_items.created_year
    filters:
      order_items.created_date: before 0 months ago
      order_items.created_year: 4 years
    sorts:
    - order_items.created_year desc
    - order_items.created_month_num
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: false
    point_style: none
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - calculation_1
    x_axis_label: Month of Year
    colors:
    - "#635189"
    - "#B1A8C4"
    - "#1EA8DF"
    - "#8ED3EF"
    y_axis_value_format: "$#,##0"
    series_types: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: '2018'
        name: '2018'
        axisId: order_items.total_sale_price
      - id: '2017'
        name: '2017'
        axisId: order_items.total_sale_price
      - id: '2016'
        name: '2016'
        axisId: order_items.total_sale_price
      - id: '2015'
        name: '2015'
        axisId: order_items.total_sale_price
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
      valueFormat: "$0,\\K\\"
    x_axis_reversed: false
    y_axis_reversed: false
    note_state: collapsed
    note_display: above
    note_text: ''
    # row: 6
    col: 1
    width: 11
    height: 8
  - title: Highest Spending Users
    name: Highest Spending Users
    model: thelook
    explore: order_items
    type: looker_map
    fields:
    - users.approx_location
    - users.gender
    - order_items.order_count
    - users.count
    - order_items.total_sale_price
    - order_items.average_spend_per_user
    - users.country
    pivots:
    - users.gender
    filters:
      users.country: USA
    sorts:
    - users.gender 0
    - order_items.total_sale_price desc 0
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    loading: false
    hidden_fields:
    - orders.count
    - users.count
    - order_items.total_sale_price
    - order_items.order_count
    map_plot_mode: points
    heatmap_gridlines: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: pixels
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_legend: true
    quantize_map_value_colors: false
    map: usa
    map_projection: ''
    quantize_colors: false
    colors:
    - whitesmoke
    - "#64518A"
    outer_border_color: "#64518A"
    inner_border_color: ''
    inner_border_width: 0.6
    outer_border_width: 2
    empty_color: ''
    map_pannable: true
    map_zoomable: true
    map_latitude: 38.20365531807149
    map_longitude: -99.931640625
    map_zoom: 3
    map_value_scale_clamp_max: 200
    map_value_scale_clamp_min: 0
    map_value_colors:
    - white
    - purple
    map_marker_radius_max: 15
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_marker_color:
    - "#64518A"
    - "#1ea8df"
    - "#a2dcf3#57BEBE"
    - "#7F7977"
    - "#B2A898"
    - "#494C52"
    heatmap_gridlines_empty: false
    reverse_map_value_colors: false
    y_axes: []
    listen:
      Date: order_items.created_date
      State: users.state
      City: users.city
    note_state: collapsed
    note_display: hover
    note_text: Bubble size corresponds to average user spend
    # row: 6
    col: 12
    width: 11
    height: 8
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: 90 days
    allow_multiple_values: true
    required: false
  - name: State
    title: State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: thelook
    explore: order_items
    listens_to_filters:
    - Country
    field: users.state
  - name: City
    title: City
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    model: thelook
    explore: order_items
    listens_to_filters:
    - State
    - Country
    field: users.city
