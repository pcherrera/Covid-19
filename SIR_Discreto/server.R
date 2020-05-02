library(reshape)
library(googlesheets4)
source("funciones/Rfunctions.R")




shinyServer(function(input, output, session) {
  # Parametros sensibles a los inputs
  dataInput = reactive({
    k = (input$tasa)/100
    H = input$H
    Tmax = input$Tmax
    d= input$d
    Datos_prueba = SIR_Datos_prueba(k,d,H)
    p = c(k,d,H)
    datos = Datos_prueba
    SIR_Prediccion(p,Tmax,Datos_prueba)
    #print(SIR_Prediccion(p,Tmax,datos))
  })
  



  
  
  # Grafico SIR simplificado 
  output$plot0 = renderPlotly({
    # Parametros interactivos
    x = dataInput()$tiempo
    S = dataInput()$S
    I = dataInput()$I
    R = dataInput()$R
    print(R)
    p = plot_ly(dataInput(), x=~tiempo, y=~S ,name = '(S) Suceptibles', type = 'scatter', mode = 'lines' )
    p = p %>% add_trace(y = ~I, name = '(I) Infectados', mode = 'lines')
    p = p %>% add_trace(y = ~R, name = '(R) Retirados', mode = 'lines')
    
    p = p %>% layout(
                   paper_bgcolor='rgb(255,255,255)', plot_bgcolor='rgb(250,250,250)',
                   xaxis = list(title = "Días"),
                   yaxis = list(title = "Nro personas",
                                gridcolor = 'rgb(255,255,255)',
                                showgrid = FALSE,
                                showline = TRUE,
                                showticklabels = TRUE,
                                tickcolor = 'rgb(255,255,255)',
                                ticks = 'inside',
                                zeroline = FALSE))
            
    
  })
  p
    }
)

