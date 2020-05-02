#Rfunctions



# ----------------------------------------------------------------------------
#  SIRPrediccion :
# ----------------------------------------------------------------------------
# Esta función devuelve un data frame con 4 columnas Dias,
# Suceptibles (S), Infectados (I) y retirados (R) 
# INPUT: p - una lista con los parametros c(k,H,d)
#        Tmax - Numero de dias que se quiere predecir
#        datos - Registro de los ultimos d dias (Se requiere dataframe de d filas)
# OUTPUT: Dataframe con las variables S,I,R en función de los días proximos. 



SIR_Prediccion=function(p,Tmax,datos){
  resultado = datos
  k = p[1]
  d = p[2]
  H = p[3]
  for (n in 1:Tmax) {
    R_n = resultado$R[n]
    S_n = resultado$S[n]
    I_n = resultado$I[n]
    R_d = resultado$R[n+d]
    I_d = resultado$I[n+d]
    S_d = resultado$S[n+d]
    R_nuevo = R_d +(k/H)*S_n*I_n
    I_nuevo = I_d +(k/H)*S_d*I_d+R_d-R_nuevo
    S_nuevo = H-R_nuevo-I_nuevo
    nuevos_datos = c(n,S_nuevo,I_nuevo,R_nuevo)
    resultado = rbind(resultado,nuevos_datos)
  }
  round(resultado)
}


# ----------------------------------------------------------------------------
#  SIR_Datos_prueba :
# ----------------------------------------------------------------------------
# Esta función devuelve un data frame ficticio 
# de los ulimos 14 dias su proposito es testear 
# la implementación.
# INPUT: k - Tasa de contagio
#        d - Nro de días que dura en promedio la infección
#        H - Población total 
#        datos - Registro de los ultimos d dias (Se requiere dataframe de d filas)
# OUTPUT: Dataframe con las variables S,I,R en función de los días proximos. 


SIR_Datos_prueba = function(k,d,H){
  I = rep(0,d+1)
  R = rep(0,d+1)
  S = H-I-R
  I[d+1]=1
  tiempo = -d:0
  Datos_prueba = data.frame(tiempo,S,I,R)
  Datos_prueba
}


