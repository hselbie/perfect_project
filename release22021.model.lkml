connection: "bq"

include: "/ecomm_views/*.view.lkml"
include: "/trip_views/*.view.lkml"
include: "/model_includes/*.lkml"

###########
#-- test
###########

explore: order_items {
  extends: [order_items_extension]
}
