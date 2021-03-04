view: users {
  sql_table_name: `looker-private-demo.ecomm.users`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  # dimension: gender {
  #   type: string
  #   sql: ${TABLE}.gender ;;
  # }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [id, last_name, first_name, order_items.count, events.count]
  }
}
view: +users {
    label: "Users"

    dimension: id {
      hidden: yes
      label: "ID"
      primary_key: yes
      type: number
      sql: ${TABLE}."ID" ;;
    }

    dimension: age {
      label: "Age"
      type: number
      sql: ${TABLE}."AGE" ;;
    }

    dimension: city {
      label: "City"
      type: string
      sql: ${TABLE}."CITY" ;;
    }

    dimension: country {
      label: "Country"
      type: string
      map_layer_name: countries
      sql: ${TABLE}."COUNTRY" ;;
    }

    # dimension: created_date {
    #   hidden: no
    #   label: "Created Date"
    #   type: string
    #   sql: ${TABLE}."CREATED_AT" ;;
    # }

    dimension: displayed_date {
      label: "A12345"
      type: date
      sql: ${created_date} ;;
      html: {{ localized_date_filter._rendered_value }} ;;
    }

    dimension: localized_date_filter {
      label: "Localized Date"
      type: string
      sql:
          {% if _user_attributes['locale'] == 'en' %} to_char(${created_date}, 'MM-DD-YYYY')
          {% elsif _user_attributes['locale'] == 'es_ES' %} to_char(${created_date}, 'DD-MM-YYYY')
          {% else %}
          ${created_date}

          {% endif %} ;;
    }


    dimension: email {
      label: "Email"
      type: string
      sql: ${TABLE}."EMAIL" ;;
    }

    dimension: first_name {
      label: "First Name"
      type: string
      sql: ${TABLE}."FIRST_NAME" ;;
    }







## Use case 1: localizing returned values from a table
## two values: 'Male', 'Female
    dimension: gender {
      label: "Gender"
      type: string
      sql: ${TABLE}."GENDER" ;;
      # sql:
      #     case ${TABLE}."GENDER"
      #       when 'Male' then '{{ _localization["gender_key_male"]}}'
      #       when 'Female' then '{{ _localization["gender_key_female"]}}'
      #     end ;;
    }






## Use case 2: localization causing different columns to be pulled within the SQL
## US customers will be returned the 'Country' column, ES customers the 'State' column
    dimension: test_label {
      label: "Locale-based column"
      type: string
      sql:
          {% if _user_attributes['locale'] == 'en' %} ${country}
          {% elsif _user_attributes['locale'] == 'es_ES' %} ${state}
          {% endif %} ;;
    }













    dimension: last_name {
      label: "Last Name"
      type: string
      sql: ${TABLE}."LAST_NAME" ;;
    }

    dimension: full_name {
      label: "Full Name"
      type: string
      sql: CONCAT(${first_name}, ' ', ${last_name}) ;;
    }

    dimension: state {
      label: "State"
      type: string
      sql: ${TABLE}."STATE" ;;
    }

    measure: count {
      label: "Count"
      type: count
      drill_fields: [id, first_name, last_name, events.count, order_items.count]
    }
}
