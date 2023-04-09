tabItem_other_data <- tabItem(
  tabName = "other_data",
  fluidRow(
    column(
      width = 6,
      box(
        title = "都道府県データ",
        width = 12,
        DTOutput("pref_data_table"),
        downloadButton("pref_data_download", "ダウンロード")
      )
    ),
    column(
      width = 6,
      box(
        title = "政令指定都市・東京特別区部の市区町村コード対応表",
        width = 12,
        DTOutput("city_desig_data_table"),
        downloadButton("city_desig_data_download", "ダウンロード")
      )
    )
  )
)

