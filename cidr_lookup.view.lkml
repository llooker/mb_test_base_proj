view: cidr_lookup {
  derived_table: {
    sql: SELECT
          addr_str,
          substr(addr_str, 1, strpos(addr_str, '/') - 1) start_ip_addr,
          NET.IPV4_TO_INT64(NET.SAFE_IP_FROM_STRING(substr(addr_str, 1, strpos(addr_str, '/') - 1))) AS start_ipv4_to_int64,
          NET.IPV4_TO_INT64(NET.SAFE_IP_FROM_STRING(substr(addr_str, 1, strpos(addr_str, '/') - 1))) + POW(2, 32 - cast(substr(addr_str, strpos(addr_str, '/') + 1) as INT64)) - 2 end_ipv4_int64,
          NET.IP_TO_STRING(NET.IPV4_FROM_INT64(
          CAST(
          NET.IPV4_TO_INT64(
          NET.SAFE_IP_FROM_STRING(
          substr(addr_str, 1, strpos(addr_str, '/') - 1)
          )
          ) + POW (2, 32 - cast(substr(addr_str, strpos(addr_str, '/') + 1) as INT64)) - 2  AS INT64)
          )) End_Ipv4
          FROM UNNEST(
            SPLIT(
               REPLACE({% parameter cidr_pattern %}, ' ', ''), ',')
          ) AS addr_str
          ;;
  }

  parameter: cidr_pattern {
    type: string
    description: "Provide comma separated list of CIDR Patterns (aaaa.bbbb.cccc.dddd/xx) "
  }

  dimension: addr_str {
    description: "Original Input String"
    type: string
    sql: ${TABLE}.addr_str ;;
  }

  dimension: start_ip_addr {
    label: "Starting IP Address"
    description: "Starting IP Address from CIDR String"
    type: string
    sql: ${TABLE}.Start_ip_addr ;;
  }

  dimension: start_ipv4_to_int64 {
    label: "Starting IP Address (Numeric)"
    description: "Numeric representation of starting IP Address from CIDR String"
    type: number
    sql: ${TABLE}.start_ipv4_to_int64 ;;
  }

  dimension: end_ipv4_int64 {
    label: "Ending IP Address (Numeric)"
    description: "Numeric representation of ending IP Address from CIDR String"
    type: number
    sql: ${TABLE}.End_ipv4_int64 ;;
  }

  dimension: end_ipv4 {
    label: "Ending IP Address"
    description: "Ending IP Address from CIDR String"
    type: string
    sql: ${TABLE}.End_Ipv4 ;;
  }
}
