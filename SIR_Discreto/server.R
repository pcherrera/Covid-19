library(reshape)
library(googlesheets4)
source("funciones/Rfunctions.R")




shinyServer(function(input, output, session) {
  # Parametros sensibles a los inputs
  dataInput = reactive({
    k = input$k
    H = input$H
    Tmax = input$Tmax
    d = 14
    I = rep(0,d+1)
    R = rep(0,d+1)
    S = H-I-R
    I[d+1]=3
    tiempo = -d:0
    Datos_prueba = data.frame(tiempo,S,I,R)
    p = c(k,d,H)
    datos = Datos_prueba
    SIR_Prediccion(p,Tmax,Datos_prueba)
    print(SIR_Prediccion(p,Tmax,datos))
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
  })
  p
    }
)

