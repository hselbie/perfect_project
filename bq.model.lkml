connection: "bq"

include: "/ecomm_views/*.view.lkml"
include: "/trip_views/*.view.lkml"

##release 1

explore: events {
 extends: [events]
}

explore: inventory_items {
  extends: [inventory_items]
}
