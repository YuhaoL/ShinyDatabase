# sudo yum install R
# ## 在Linux的R上安装shiny的R包
# sudo su - -c "R -e \"install.packages('shiny', repos='https://cran.rstudio.com/')\""
# Download and Install
# wget https://download3.rstudio.org/centos7/x86_64/shiny-server-1.5.16.958-x86_64.rpm
# sudo yum install --nogpgcheck shiny-server-1.5.16.958-x86_64.rpm

# sudo systemctl status shiny-server
# sudo systemctl enable shiny-server
# sudo systemctl disable shiny-server

# install.packages("shinydashboard")

# a header（标题栏）
# a sidebar（侧边栏）,
# a body（展示栏）.
# ui.R

library(shinydashboard)
dashboardPage(
  dashboardHeader(title = "ESCC databse" ),
  dashboardSidebar(),
  dashboardBody()
)
## app.R ##
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader("ESCC databse"),
  dashboardSidebar(),
  dashboardBody()
)
server <- function(input, output) { }

shinyApp(ui, server)
