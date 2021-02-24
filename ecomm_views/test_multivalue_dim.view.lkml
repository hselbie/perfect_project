explore: test_multivalue_dim{}
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


  dimension: client {
    type: string
    sql: ${TABLE}.client ;;
  }

  dimension: my_value {
    type: number
    sql: ${TABLE}.value ;;
 }

  dimension: value_format_no_style {
    type: number
    sql: case when ${my_value} < 1 then ${my_value} * 100 else ${my_value} end ;;
  }

  dimension: format_value_percent {
    value_format_name: percent_1
    type: number
    sql: case when ${my_value} < 1 then ${my_value} else null end ;;
  }

  dimension: format_value_int {
    value_format_name: usd
    type: number
    sql: case when ${my_value} > 1 then ${my_value} else null end ;;
  }


  measure: sum_format_value_int {
    type: sum
    sql: ${format_value_int} ;;
  }

  measure: sum_format_value_percent {
    type: sum
    sql: ${format_value_percent} ;;
  }


}
