#connection: "thelook_events"
connection: "snowlooker"
#connection: "biquery_publicdata_standard_sql"

# include all the views
include: "/**/*.view.lkml"

# include the files where we have declared the explores
include: "/**/*.explores.lkml"

include: "all_access_grants.lkml"
#### TEST


datagroup: mb_test_base_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: mb_test_base_project_default_datagroup
