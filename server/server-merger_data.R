server_merger_data <- function(input, output, session) {
  reactive_merger_data <- reactive({
    get_merger_data(from = input$merger_data_date_range[[1L]],
                    to = input$merger_data_date_range[[2L]],
                    merge = !input$merger_data_not_merge_city_desig,
                    only_changed = !input$merger_data_not_only_changed)
  })

  output$merger_data_table <- renderDT(reactive_merger_data()) |>
    bindEvent(input$merger_data_show)

  output$merger_data_download <- downloadHandler(
    filename = function() {
      "merger_data.csv"
    },
    content = function(file) {
      readr::write_csv(reactive_merger_data(), file)
    }
  )
}
