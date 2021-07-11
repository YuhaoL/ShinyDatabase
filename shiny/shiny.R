library(shiny)
library(bslib)
#hematic::thematic_shiny(font = "auto")
############## ui ###############
ui <- navbarPage(
  ## title
  "ESCC Database",
  ## 
  theme = bs_theme(bootswatch = "sandstone"),
  #heme = bs_theme(with_themer = TRUE),
  ## first tab -- applications
  tabPanel(
    ## tab title
    "Applications",
    # fluidPage(fluidRow(
    #         column(12,
    navlistPanel(
      ## navlistPanel title
      "Application list",
      ## first app
      tabPanel(
        ## app title
        "Single cell",
        sidebarLayout(
          sidebarPanel(
                textInput("gene_input", h3("Your request gene"),
                          value = "Enter a gene name"),
                #ctionButton("Submit",icon("DNA"), style=(color="#28a745"))),
                actionButton("Submit_button", "Submit", icon("paper-plane"), 
                             style="color: #fff; background-color: #337ab7; border-color: #2e6da4")),
        mainPanel(
          textOutput("selected_var"),fluid = TRUE,
          widths = 7
      ))
      ),
      ## second app
      tabPanel("Component 2"),
      fluid = TRUE,
      widths = c(2,7))
   ),
  ## second tab -- support
  tabPanel("support")
           
)
################ server ###########
server <- function(input, output) {
  bs_theme()
  data <-readRDS(file ="data/GSE91061_count.rds")
  
  output$selected_var <- renderText({
    datasetInput <- eventReactive(input$Submit_button,{
      input$gene_input
    }, ignoreNULL = FALSE)
    genename <- datasetInput()
    if (genename == "Enter a gene name"){
      paste("")
    }
    else if (!toupper(genename) %in% rownames(data)){
       paste("There is no gene in our dataset that meets your requirement")
      }
    else {
      genename <- toupper(genename)
      req <- data[genename,]
      req <- req[,req != 0]
      sample_name <- colnames(req)
      #paste("The gene you have selected is", input$gene_input)
      samples <- paste(colnames(req), collapse = ",")
      line1 <- paste("There are", length(sample_name), "samples that this gene expressed in.")
      paste(line1, "Those samples are",samples)
     
    
    }
  })
}

shinyApp(ui = ui, server = server)