library(shiny)

# Sample Data
data <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David"),
  Age = c(25, 30, 35, 40)
)

# Define the UI
ui <- fluidPage(
  titlePanel("Shiny Table with Filter"),
  sidebarLayout(
    sidebarPanel(
      textInput("search_input", "Filter by Name", ""),
      br(),
      actionButton("reset_btn", "Reset Filter")
    ),
    mainPanel(
      tableOutput("data_table")
    )
  )
)

# Define the server
server <- function(input, output) {
  # Filter the data based on the search input
  filtered_data <- reactive({
    filter_str <- input$search_input
    if (nchar(filter_str) == 0) {
      data
    } else {
      data[data$Name == filter_str, ]
    }
  })
  
  # Render the table
  output$data_table <- renderTable({
    filtered_data()
  })
  
  # Reset the filter
  observeEvent(input$reset_btn, {
    updateTextInput(session, "search_input", value = "")
  })
}

# Run the Shiny app
shinyApp(ui, server)
