- dashboard: base_dashboard
  title: Base Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: Header tile
    type: text
    title_text: Header tile
    subtitle_text: ''
    body_text: This is a standard tile that should go on all dashboards
    row: 0
    col: 0
    width: 20
    height: 2
  - title: Last 30 days Orders
    name: Last 30 days Orders
    model: mb_test_base_project
    explore: order_items
    type: looker_line
    fields: [order_items.created_date, order_items.count]
    filters:
      order_items.created_date: 30 days
    sorts: [order_items.created_date desc]
    limit: 500
    query_timezone: America/New_York
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    row: 2
    col: 0
    width: 20
    height: 6
