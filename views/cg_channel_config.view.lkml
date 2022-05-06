view: cg_channel_config {
  sql_table_name: public.cg_channel_config ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension: application {
    type: string
    sql: ${TABLE}."application" ;;
  }

  dimension_group: createdat {
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
    sql: ${TABLE}."createdat" ;;
  }

  dimension: creator {
    type: string
    sql: ${TABLE}."creator" ;;
  }

  dimension: escalation_enabled {
    type: yesno
    sql: ${TABLE}."escalation_enabled" ;;
  }

  dimension: escalation_id {
    type: number
    sql: ${TABLE}."escalation_id" ;;
  }

  dimension: facebook_config {
    type: string
    sql: ${TABLE}."facebook_config" ;;
  }

  dimension: facebook_enabled {
    type: yesno
    sql: ${TABLE}."facebook_enabled" ;;
  }

  dimension: sms_config {
    type: string
    sql: ${TABLE}."sms_config" ;;
  }

  dimension: sms_enabled {
    type: yesno
    sql: ${TABLE}."sms_enabled" ;;
  }

  dimension: tenant {
    type: string
    sql: ${TABLE}."tenant" ;;
  }

  dimension_group: updatedat {
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
    sql: ${TABLE}."updatedat" ;;
  }

  dimension: webchat_config {
    type: string
    sql: ${TABLE}."webchat_config" ;;
  }

  dimension: webchat_enabled {
    type: yesno
    sql: ${TABLE}."webchat_enabled" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
