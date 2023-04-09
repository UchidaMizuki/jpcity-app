source("ui/ui-merger_data.R")
source("ui/ui-city_data.R")
source("ui/ui-other_data.R")

# ui ----------------------------------------------------------------------

header <- dashboardHeader(title = "jpcity App")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("廃置分合データ取得",
             tabName = "merger_data"),
    menuItem("市区町村データ取得",
             tabName = "city_data"),
    menuItem("その他データ取得",
             tabName = "other_data")
  )
)

body <- dashboardBody(
  tabItems(
    tabItem_merger_data,
    tabItem_city_data,
    tabItem_other_data
  )
)

ui <- dashboardPage(header, sidebar, body)
