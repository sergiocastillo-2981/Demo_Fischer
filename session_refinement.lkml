include: "views/session.view.lkml"

view: +session {
  #Dimensions
  dimension: handle_time {
    type: number
    sql: coalesce(floor(extract(EPOCH from  sessionendedat-"createdAt")),0) ;;
  }

  #Measures
  measure: count_ca_sessions {
    type: count_distinct
    sql: ${sessionid} ;;
    filters: [dwf_product: "CA"]
  }

  measure: count_escalations {
    type: count
    filters: [dwf_product: "CA",escalationreason: "-NULL"]
  }

  measure: percent_escalations {
    type: number
    sql: 1.0*${count_escalations}/nullif(${sessionhistory.count_engagements},0) ;;
    value_format_name: percent_2
  }

  measure: count_deflections {
    type: number
    sql: ${sessionhistory.count_engagements}-${count_escalations} ;;
  }

  measure: percent_deflections {
    type: number
    sql: 1.0*${count_deflections}/nullif(${sessionhistory.count_engagements},0) ;;
    value_format_name: percent_2
  }
}
