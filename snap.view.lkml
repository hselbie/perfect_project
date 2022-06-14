view: snap_base {
  derived_table: {
    sql: select * From public.order_items ;;
  }
  dimension: andrew {}
}

view: snap_rollup {
  extends: [snap_base]
  derived_table: {
    sql: select * from public.rolled_up ;;
  }
}
