view: businessunit {
  sql_table_name: public.businessunit ;;
  drill_fields: [businessunitid]

  dimension: businessunitid {
    primary_key: yes
    type: string
    sql: ${TABLE}."businessunitid" ;;
  }

  dimension: businessunitdescription {
    type: string
    sql: ${TABLE}."businessunitdescription" ;;
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
    sql: ${TABLE}."createdAt" ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}."updatedAt" ;;
  }

  measure: count {
    type: count
    drill_fields: [businessunitid]
  }
}
