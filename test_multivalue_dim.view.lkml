view: test_multivalue_dim {
  derived_table: {
    sql: with x as (select 'gcp' as client, 50000 as value
      union all
      select 'terratdata', 2000
      union all
      select 'mcterry', 0.6
      union all
      select 'testymc', 0.2)

      select * from x
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: client {
    type: string
    sql: ${TABLE}.client ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
    html:
    {% if value._value < 1 %}
    {{value}} * 100
    {% else %}
    {{value}}
    {% endif %};;
  }



  set: detail {
    fields: [client, value]
  }
}
