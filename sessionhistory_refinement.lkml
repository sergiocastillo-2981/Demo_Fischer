include: "views/sessionhistory.view.lkml"

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
