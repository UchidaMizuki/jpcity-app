server_city_data <- function(input, output, session) {
  reactive_city_data <- reactive({
    get_city_data(input$city_data_date,
                  merge = !input$city_data_not_merge_city_desig)
  })

  output$city_data_table <- renderDT(reactive_city_data()) |>
    bindEvent(input$city_data_show)

  output$city_data_download <- downloadHandler(
    filename = function() {
      "city_data.csv"
    },
    content = function(file) {
      readr::write_csv(reactive_city_data(), file)
    }
  )
}
