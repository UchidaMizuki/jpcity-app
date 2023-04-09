server_other_data <- function(input, output, session) {
  # pref_data
  output$pref_data_table <- renderDT(pref_data)
  output$pref_data_download <- downloadHandler(
    filename = function() {
      "pref_data.csv"
    },
    content = function(file) {
      readr::write_csv(pref_data, file)
    }
  )

  # city_desig_data
  output$city_desig_data_table <- renderDT(city_desig_data)
  output$city_desig_data_download <- downloadHandler(
    filename = function() {
      "city_desig_data.csv"
    },
    content = function(file) {
      readr::write_csv(city_desig_data, file)
    }
  )
}
