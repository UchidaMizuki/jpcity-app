library(shiny)

source("server/server-merger_data.R")
source("server/server-city_data.R")
source("server/server-other_data.R")

# server ------------------------------------------------------------------

# Define server function
function(input, output, session) {
  server_merger_data(input, output, session)
  server_other_data(input, output, session)
  server_city_data(input, output, session)
}
