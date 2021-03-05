connection: "bq"

include: "/ecomm_views/*.view.lkml"
include: "/trip_views/*.view.lkml"
include: "/explores.lkml"

###########
#-- Release v3 2021
###########

explore: order_items {
  extends: [order_items_extension]
}
