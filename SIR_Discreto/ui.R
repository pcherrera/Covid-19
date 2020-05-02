library(shiny)
library(shinyWidgets)
library(plotly)

fluidPage(
  titlePanel("Proyecciones modelo SIR simplificado"),
  hr(),
  p(div(HTML("Este en un modelo en desarrollo"))),
  
  sidebarPanel(
    fluidRow(
      column(width=12,
             sliderInput("k", div(HTML("Tasa de contagio")), 0, 1, 0.5, step=0.01, post="/Días"),
             numericInput("Tmax",div(HTML("Días para Predicción:")),value= 100, max=10^10, min=0, step = 10  ),
             numericInput("H", div(HTML("Tamaño de la población:")), value=1000, max=10^10, min=1000, step=1000),
             hr(),
             )
    )
  ),
  
  mainPanel(
    navbarPage("Salida:", 
               tabPanel("Proyecciones",
                        fluidPage(fluidRow(
                          h3("Estimaciones Covid-19 (Inserte gráfico aquí)"),
                          plotlyOutput("plot0")
                        ))),
               tabPanel("Modelo",
                        fluidPage(
                          h3("Inserte Markdown con el modelo")
                        )),
               tabPanel("Desarrollo",
                        fluidPage(
                          h3("Inserte Desarrolladores")
                        )))
    
  )
)


