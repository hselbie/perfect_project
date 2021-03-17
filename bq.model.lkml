connection: "bq"

include: "/ecomm_views/*.view.lkml"
include: "/trip_views/*.view.lkml"
include: "/explores.lkml"
include: "/parameters.lkml"

###########
#-- Master Branch
###########

explore: order_items {
#   sql_always_where:
#   {% if parameter.test_dropdown._is_filtered %}
#     ${users.country} = {{ parameter.test_dropdown._parameter_value }}
#   {% else %}
#     1=1

#   {% endif %};;
#   join: users {
#     type: left_outer
#     sql_on: ${users.id} = ${order_items.user_id} ;;
#   }
#   join: parameter {
#     sql:  ;;
#   }
}

explore: test_state_filter {
  join: parameter {
    sql:  ;;
}
}

## adding new features
