connection: "thelook_events"

# include all the views
include: "/**/*.view.lkml"
#### TEST


datagroup: mb_test_base_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: mb_test_base_project_default_datagroup


explore: order_items {
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}


# explore: distribution_centers_base {
#   view_name: distribution_centers
#   extension: required
# }

# explore: events_base {
#   view_name: events
#   extension: required
#   description: "Events Explore testing testing"
#   join: users {
#     type: left_outer
#     sql_on: ${events.user_id} = ${users.id} ;;
#     relationship: many_to_one
#   }

# }


# explore: inventory_items_base {
#   view_name: inventory_items
#   extension: required
#   join: products {
#     type: left_outer
#     sql_on: ${inventory_items.product_id} = ${products.id} ;;
#     relationship: many_to_one
#   }

#   join: distribution_centers {
#     type: left_outer
#     sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: products {
#   extension: required
#   join: distribution_centers {
#     type: left_outer
#     sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: users {}
