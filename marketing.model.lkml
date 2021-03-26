connection: "bq"

# include: "/views/*.view.lkml"
include: "/model_includes/*.lkml" # include all views in the views/ folder in this project
include: "/ecomm_views/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: marketing_user {
  extends: [order_items_extension]
  # join: myextraview {}
}

explore: test {
  extends: [users]
  view_name: users
  join: parameter {
    sql:  ;;
  }
}
