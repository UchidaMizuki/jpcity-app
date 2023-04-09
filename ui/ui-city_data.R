tabItem_city_data <- tabItem(
  tabName = "city_data",
  fluidRow(
    column(
      width = 12,
      box(
        title = "時点選択",
        width = 12,
        dateInput(
          "city_data_date",
          label = "日付を選択してください",
          value = end_city,
          min = start_city,
          max = end_city,
          language = "ja"
        ),
        checkboxInput(
          "city_data_not_merge_city_desig",
          label = "政令指定都市の区を含む",
          value = FALSE
        ),
        actionButton("city_data_show", "表示"),
      )
    ),
    column(
      width = 12,
      box(
        title = "市区町村データ",
        width = 12,
        DTOutput("city_data_table"),
        downloadButton("city_data_download", "ダウンロード")
      )
    )
  )
)
