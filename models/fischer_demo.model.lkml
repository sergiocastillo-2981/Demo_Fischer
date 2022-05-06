connection: "fischer_demo3"

# include all the views
include: "/views/**/*.view"
include: "/session_refinement.lkml"
include: "/sessionhistory_refinement.lkml"
include: "/CA_Metrics_Demo.dashboard"

datagroup: fischer_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: fischer_demo_default_datagroup

explore: session{

  join: sessionhistory {
    type: left_outer
    sql_on: ${session.sessionid} = ${sessionhistory.sessionid} ;;
    relationship: one_to_many
  }

  join: intentdetails {
    type: left_outer
    sql_on: ${sessionhistory.correlationid} = ${intentdetails.correlationid} ;;
    relationship: many_to_one
  }

  join: cg_channel_config {
    view_label: "Channel"
    type: left_outer
    sql_on: ${session.channelid} = ${cg_channel_config.id} ;;
    relationship: many_to_one
  }
}
