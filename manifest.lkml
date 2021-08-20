constant: button_padding { value: "padding: 15px 32px;" }
constant: border_radius { value: "border-radius: 10px;" }
constant: border {  value: "border: none;" }
constant: fontsize { value: "font-size:1vw;" }
constant: width { value: "width:100%;" }
constant: background_color { value: "background-color: #36C5F0;" }
constant: text_color { value:"color: white;" }
constant: text_decoration { value: "text-decoration:none;" }
constant: text_align { value: "text-align: center;" }
constant: display { value: "display: inline-block;" }
constant: button_margin { value: "margin: 4px 2px;" }
constant: button_overlay { value: "cursor: pointer;
  -webkit-transition-duration: 0.4s;
transition-duration: 0.4s;" }
constant: button_shadow { value: "box-shadow: 0 8px 16px 0 rgba(0,0,0,0.24);" }
constant: lookml_navbar_glossary {
  value:
  "<div style='@{text_align}
  @{display}
  @{fontsize}
  @{border}
  @{border_radius}
  @{text_color}
  @{background_color}
  @{button_padding}
  @{text_decoration}
  @{button_margin}
  @{button_overlay}
  @{button_shadow}
  '>
  <a href='https://sites.google.com/slack-corp.com/slacksanalyticsmetricsglossary/home'>Glossary</a>
  </div>"
}

constant: lookml_navbar_helpchannel {
  value:
  "<div style='@{text_align}
  @{display}
  @{fontsize}
  @{border}
  @{border_radius}
  @{text_color}
  @{background_color}
  @{button_padding}
  @{text_decoration}
  @{button_margin}
  @{button_overlay}
  @{button_shadow}
  '>
  <a href='https://tinyspeck.slack.com/messages/CDYRR78K0'>#help-analytics-studio</a>
  </div>"
}

constant: button_start {
  value:   "<div style='@{text_align}
  @{display}
  @{fontsize}
  @{border}
  @{border_radius}
  @{text_color}
  @{background_color}
  @{button_padding}
  @{text_decoration}
  @{button_margin}
  @{button_overlay}
  @{button_shadow}
  '>"
}

constant: dashboard_data_success {
  value: "<div style='
  @{width}
  background-color:#2EB67D;
  border-radius: 2px;
  @{border}
  @{text_align}
  @{text_color}
  @{fontsize}
  @{button_padding}
  @{text_decoration}
  @{button_overlay}'>You have the latest data!</div>"
}

constant: dashboard_data_success_with_date {
  value: "<div style='
  @{width}
  background-color:#2EB67D;
  border-radius: 2px;
  @{border}
  @{text_align}
  @{text_color}
  @{fontsize}
  @{button_padding}
  @{text_decoration}
  @{button_overlay}'>Data as of: {{ latest_date_dt.yesterday._value }}</div>"
}

constant: dashboard_data_fail {
  value: "<div style='
  @{width}
  background-color:red;
  border-radius: 2px;
  @{border}
  display:inline-block;
  @{text_align}
  @{text_color}
  @{fontsize}
  @{button_padding}
  @{button_overlay}
  text-decoration:none;'>You do not have the latest data :(</div>"
}

# This styling is used to wrap around the navigation tabs
constant: navigation_style {
  value: "font-size: 18px;
  padding: 5px 10px 0 10px;
  height: 60px"
}

# This styling is used for the current selected tab on a dashboard
constant: selected_navigation_tab_style {
  value: "color: #696969;
  padding: 5px 15px;
  border-top: solid 1px #64518A;
  border-left: solid 1px #64518A;
  border-right: solid 1px #64518A;
  border-radius: 5px 5px 0 0;
  float: left;
  line-height: 40px;
  font-weight: bold;
  background-color: #D3D3D3"
}

# This styling is used for the unselected tabs on a dashboard
# Removed the bottom border from this constant because a divider is being used for the navigation tabs on the CMO dashboards -VD
constant: unselected_navigation_tab_style {
  value: "color: #696969;
  padding: 5px 15px;
  float: left;
  line-height: 40px;
  background-color: #ffffff"
  # border-bottom: solid 1px #64518A
}

# Solid horizontal line
constant: divider {
  value: "border-bottom: solid 1px #64518A"
}

constant: button_end {
  value: "</div>"
}

constant: yoy_start {
  value: "DATEADD('YEAR', -1,"
}

constant: yoy_end {
  value: ")"
}

constant: up_down_arrow_html {
  value: "
  {% if value > 0 %} {% assign indicator = 'green,▲' | split: ',' %} {% elsif value < 0 %} {% assign indicator = 'red,▼' | split: ',' %} {% else %}{% assign indicator = 'black,▬' | split: ',' %}  {% endif %}"
}

## this formatting allows for 0.0M, 0.0K, 0.0, -0.0, -0.0K, and -0.0M buckets
constant: large_number_postive_negative_format {
  value: "{% if value >=1000000 %}
  {{ value | divided_by: 1000000.0 | round: 1 }}M
  {% elsif value >=1000 %}
  {{ value | divided_by: 1000.0 | round: 1 }}K
  {% elsif value >= 0 %}
  {{ value | divided_by: 1.0 | round: 1 }}
  {% elsif value <=-1000000 %}
  {{ value | divided_by: 1000000.0 | round: 1 }}M
  {% elsif value <=-1000 %}
  {{ value | divided_by: 1000.0 | round: 1 }}K
  {% elsif value <0 %}
  {{ value | divided_by: 1.0 | round: 1 }}
  {% endif %}"
}

## this formatting allows for 0.0M, 0.0K, 0.0, -0.0, -0.0K, and -0.0M buckets
constant: large_money_postive_negative_format {
  value: "{% if value >=1000000 %}
  ${{ value | divided_by: 1000000.0 | round: 1 }}M
  {% elsif value >=1000 %}
  ${{ value | divided_by: 1000.0 | round: 1 }}K
  {% elsif value >= 0 %}
  ${{ value | divided_by: 1.0 | round: 1 }}
  {% elsif value <=-1000000 %}
  -${{ value | divided_by: -1000000.0 | round: 1 }}M
  {% elsif value <=-1000 %}
  -${{ value | divided_by: -1000.0 | round: 1 }}K
  {% elsif value <0 %}
  -${{ value | divided_by: -1.0 | round: 1 }}
  {% endif %}"
}

constant: param {
  value: "parameter: test {}"
}

localization_settings: {
  default_locale: en
  localization_level: permissive
}
