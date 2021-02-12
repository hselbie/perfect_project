connection: "bq"

include: "/ecomm_views/*.view.lkml"
include: "/trip_views/*.view.lkml"

##release 1
#release1again

explore: events {
 extends: [events]
}

explore: inventory_items {
  extends: [inventory_items]
}
