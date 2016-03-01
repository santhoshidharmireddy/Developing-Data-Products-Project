library(shiny)

shinyUI(
  fluidPage(
    titlePanel("The Relationship Between Variables and Miles per Gallon (MPG)"),
    sidebarLayout(
      sidebarPanel(
        selectInput("variable", "Variable:",
                    c("Number of cylinders" = "cyl",
                      "Displacement (cu.in.)" = "disp",
                      "Gross horsepower" = "hp",
                      "Rear axle ratio" = "drat",
                      "Weight (lb/1000)" = "wt",
                      "1/4 mile time" = "qsec",
                      "V/S" = "vs",
                      "Transmission" = "am",
                      "Number of forward gears" = "gear",
                      "Number of carburetors" = "carb"
                    )),
        submitButton('Submit')
        ),
      mainPanel(
        h3(textOutput("caption")),
                    tabPanel("Regression model", 
                             plotOutput("mpgPlot"),
                             verbatimTextOutput("fit")
                    )
        )
      )
    )
  )
