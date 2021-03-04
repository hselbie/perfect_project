connection: "bq"

include: "/ecomm_views/*.view.lkml"
include: "/trip_views/*.view.lkml"
include: "/explores.lkml"

###########
#-- Release 1 Branch
###########

explore: order_items {
  extends: [order_items_extension]
}
