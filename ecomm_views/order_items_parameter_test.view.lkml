view: order_items_parameter_test {
  derived_table: {
    explore_source: order_items {
      column: first_name { field: users.first_name }
        filters: {
          field: users.first_name
          value: "{{ _user_attributes['status'] }}"
        }
    }
  }
  dimension: first_name {}
}
