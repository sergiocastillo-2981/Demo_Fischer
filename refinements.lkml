include: "views/session.view.lkml"
include: "views/sessionhistory.view.lkml"
include: "views/intentdetails.view.lkml"



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

view: +sessionhistory {
  #Dimensions
  dimension: source_url {
    type: string
    sql: (${data}->'userMeta')->>'origin' ;;
  }

  dimension: user_returning {
    type: string
    sql: ((${data}->'commonContext')->'user.returning')->>'value'  ;;
  }

  dimension: referrer {
    type: string
    sql:  (${data}->'userMeta')->>'referrer' ;;
  }

  #Measures
  measure: count_engagements {
    type: count_distinct
    sql:  CASE WHEN ${session.dwf_product} = 'CA' and ${partytype} = 'customer' and messagetext<>'Hi'
          THEN ${session.sessionid}
          ELSE NULL
          END ;;
  }

  measure: count_ca_user_messages {
    type: count
    filters: [session.dwf_product: "CA",partytype: "customer",eventtype: "messageReceived"]
  }

  measure: count_ca_messages {
    type: count
    filters: [session.dwf_product: "CA",partytype: "customer,agent,bot"]
  }

  measure: avg_ca_messages {
    type: number
    sql: 1.0*${count_ca_messages} / nullif( ${session.count_ca_sessions} ,0) ;;
    value_format: "0.##"

  }

}

view: +intentdetails {
  #Measures
  measure: count_ca_intents {
    type: count
    filters: [session.dwf_product: "CA"]
  }
}
