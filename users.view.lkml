view: users {
  sql_table_name: USERS ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.AGE ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.CITY ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CREATED_AT ;;
  }

  dimension: email {
    required_access_grants: [can_see_pii]
    type: string
    sql: ${TABLE}.EMAIL ;;
  }

  dimension: first_name {
    required_access_grants: [can_see_pii]
    type: string
    sql: ${TABLE}.FIRST_NAME ;;
  }

  dimension: full_name {
    required_access_grants: [can_see_pii]
    type: string
    sql: concat(${first_name}, cast(' ' as char), ${last_name}) ;;
  }

  dimension: gender {
    required_access_grants: [can_see_pii]
    type: string
    sql: ${TABLE}.GENDER ;;
  }

  dimension: last_name {
    required_access_grants: [can_see_pii]
    type: string
    sql: ${TABLE}.LAST_NAME ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.LATITUDE ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.LONGITUDE ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.STATE ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.TRAFFIC_SOURCE ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.ZIP ;;
  }

  dimension: address_city_state_zip {
    type: string
    sql:  ${city} || ', ' || ${state} || ' ' ${zip};;
  }
  measure: count {
    type: count
    drill_fields: [id, last_name, first_name, events.count, order_items.count]
  }
}
