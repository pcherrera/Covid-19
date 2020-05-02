library(shiny)
library(shinyWidgets)
library(plotly)

# Interfaz gráfica 

fluidPage(
  # Título del modelo 
  titlePanel("Proyecciones modelo SIR discreto"),
  hr(),
  p(div(HTML("Esta api está hecha con fines academicos y divulgativos. No pretende ser una herramienta para tomar descisiones gubernamentales. "))),
  
  sidebarPanel(
    fluidRow(
      column(width=12,
             # Panel izquierdo 
             sliderInput("tasa", div(HTML("Tasa de contagio")), 0, 100, 25, step=0.05, post="%"),
             sliderInput("d", div(HTML("Días en promedio que dura la infección ")), 0, 30, 14, step=1, post="Días"),
             numericInput("Tmax",div(HTML("Días para Predicción:")),value= 100, max=10^10, min=0, step = 10,),
             numericInput("H", div(HTML("Tamaño de la población:")), value=1000, max=10^10, min=1000, step=1000),
             hr(),
             )
    )
  ),
  
  mainPanel(
    # Panel principal donde se pondran los gráficos
    navbarPage("Salida:", 
               tabPanel("Propagación",
                        fluidPage(fluidRow(
                          h3("Propagación COVID-19 acorde SIR"),
                          plotlyOutput("plot0")
                          
                        ))),
               tabPanel("Modelo",
                        fluidPage(
                          h3("Inserte Markdown con el modelo")
                        )),
               tabPanel("Desarrollo",
                        fluidPage(
                          includeMarkdown("Desarrollo.Rmd")
                        )))
    
  )
)


