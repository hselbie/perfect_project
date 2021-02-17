connection: "bq"

include: "/ecomm_views/*.view.lkml"
include: "/trip_views/*.view.lkml"

###########
#-- Master Branch
###########

explore: order_items {
  extends: [order_items]
}

explore: users {
  extends: [users]
}
