- dashboard: extended_dashboard_2
  include: base_dashboard.dashboard
  title: Extended Dashboard 2
  layout: newspaper
  preferred_viewer: dashboards-next
  extends: base_dashboard
  elements:
  - name: Header tile
    type: text
    title_text: Header tile
    subtitle_text: ''
    body_text: This is a extedned tile that should replace the oringinal tile
    row: 0
    col: 0
    width: 20
    height: 2
  - title: Top Products
    name: Top Products
    model: mb_test_base_project
    explore: order_items
    type: looker_grid
    fields: [products.name, inventory_items.cost, order_items.average_order_price,
      order_items.total_profit]
    filters:
      order_items.created_date: 30 days
    sorts: [order_items.total_profit desc]
    limit: 10
    query_timezone: America/New_York
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 2
    col: 0
    width: 20
    height: 6
