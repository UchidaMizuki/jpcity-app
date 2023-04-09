tabItem_merger_data <- tabItem(
  tabName = "merger_data",
  fluidRow(
    column(
      width = 12,
      box(
        title = "期間選択",
        width = 12,
        dateRangeInput(
          inputId = "merger_data_date_range",
          label = "日付を選択してください",
          min = start_city,
          max = end_city,
          separator = " から "
        ),
        checkboxInput(
          "merger_data_not_merge_city_desig",
          label = "政令指定都市の区を含む",
          value = FALSE
        ),
        checkboxInput(
          "merger_data_not_only_changed",
          label = "変更なしの市区町村コードも取得",
          value = FALSE
        ),
        actionButton("merger_data_show", "表示")
      )
    ),
    column(
      width = 12,
      box(
        title = "廃置分合データ",
        width = 12,
        DTOutput("merger_data_table"),
        downloadButton("merger_data_download", "ダウンロード")
      )
    )
  )
)
