connection: "bq"

include: "/ecomm_views/*.view.lkml"
include: "/trip_views/*.view.lkml"
include: "/explores.lkml"
include: "test.lkml"

###########
#-- test
###########

explore: order_items {
  extends: [order_items_extension]
}
