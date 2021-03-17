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

view: test_state_filter {
  derived_table: {
    sql:
    SELECT
      users.country  AS country,
      users.state  AS state
    FROM `looker-private-demo.ecomm.order_items`
         AS order_items
    LEFT JOIN `looker-private-demo.ecomm.users`
         AS users ON order_items.user_id = users.id
    WHERE
     {% if parameter.test_dropdown._is_filtered %}
    ${users.country} = {{ parameter.test_dropdown._parameter_value }}
  {% else %}
    1=1

  {% endif %}

    GROUP BY 1,2
    ORDER BY 1
    LIMIT 500 ;;

    }
    dimension: country {}
    dimension: state {}
  }
