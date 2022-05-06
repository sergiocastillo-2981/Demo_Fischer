view: intentdetails {
  sql_table_name: public.intentdetails ;;
  drill_fields: [intentdetailid]

  dimension: intentdetailid {
    primary_key: yes
    type: number
    sql: ${TABLE}."intentdetailid" ;;
  }

  dimension: confidence {
    type: number
    sql: ${TABLE}."confidence" ;;
  }

  dimension: correlationid {
    type: string
    sql: ${TABLE}."correlationid" ;;
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

  dimension: intent {
    type: string
    sql: ${TABLE}."intent" ;;
  }

  dimension: orchestratorid {
    type: number
    value_format_name: id
    sql: ${TABLE}."orchestratorid" ;;
  }

  dimension: response_index {
    type: number
    sql: ${TABLE}."response_index" ;;
  }

  dimension: sessionid {
    type: string
    sql: ${TABLE}."sessionid" ;;
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
    drill_fields: [intentdetailid]
  }
}
