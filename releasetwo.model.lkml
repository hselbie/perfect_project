connection: "bq"

include: "/ecomm_views/*.view.lkml"
include: "/trip_views/*.view.lkml"

explore: order_items {
  extends: [order_items]
}
##releasetwo
explore: users {
  extends: [users]
}
