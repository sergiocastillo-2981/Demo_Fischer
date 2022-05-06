view: device {
  sql_table_name: public.device ;;
  drill_fields: [deviceid]

  dimension: deviceid {
    primary_key: yes
    type: string
    sql: ${TABLE}."deviceid" ;;
  }

  dimension: caller {
    type: string
    sql: ${TABLE}."caller" ;;
  }

  dimension: channeltype {
    type: string
    sql: ${TABLE}."channeltype" ;;
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

  dimension: devicestate {
    type: string
    sql: ${TABLE}."devicestate" ;;
  }

  dimension: devicetype {
    type: string
    sql: ${TABLE}."devicetype" ;;
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

  dimension: userid {
    type: string
    sql: ${TABLE}."userid" ;;
  }

  measure: count {
    type: count
    drill_fields: [deviceid]
  }
}
