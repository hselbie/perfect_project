# If necessary, uncomment the line below to include explore_source.
# include: "bq.model.lkml"

view: derived_table {
  derived_table: {
    explore_source: order_items {
      column: user_id {}
      column: brand { field: products.brand }
      column: count {}
    }
  }
  dimension: user_id {
    type: number
  }
  dimension: brand {}
  dimension: count {
    type: number
  }
}
