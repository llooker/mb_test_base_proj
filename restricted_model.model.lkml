connection: "snowlooker"

include: "*.view.lkml"                # include all views in the views/ folder in this project
include: "mb_test_base_project.explores.lkml"
include: "all_access_grants.lkml"
include: "extended_dashboard_2.dashboard"

 explore: users_restricted {
   extends: [users]
   from: users
  fields: [ALL_FIELDS*, -users.email, -users.age]
 }
