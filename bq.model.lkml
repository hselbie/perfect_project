connection: "bq"

include: "/ecomm_views/*.view.lkml"
include: "/trip_views/*.view.lkml"
include: "/explores.lkml"

###########
#-- release 36
###########

explore: order_items {
  extends: [order_items_extension]
}
