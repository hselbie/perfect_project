connection: "bq"

include: "/ecomm_views/*.view.lkml"
include: "/trip_views/*.view.lkml"

###########
#-- Release 3
###########

explore: order_items {
  extends: [order_items]
}

explore: users {
  extends: [users]
}
