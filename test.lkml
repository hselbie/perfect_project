test: model_name {
      explore_source: order_items {
        column: model_name {}
      }
      assert: test  {
        expression: ${order_items.model_name} = "release22021" ;;
      }

}
