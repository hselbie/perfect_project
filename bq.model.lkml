connection: "bq"

include: "/ecomm_views/*.view.lkml"
include: "/trip_views/*.view.lkml"
include: "/explores.lkml"

###########
#-- Master Branch
###########

explore: order_items {
  sql_always_where:
  {% if order_items.test_dropdown._is_filtered %}
   ${users.age} = 25
  {% else %}
  ${users.age} = {{ _user_attributes['age']  }}

  {% endif %};;
  extends: [order_items_extension]
}

## adding new features
