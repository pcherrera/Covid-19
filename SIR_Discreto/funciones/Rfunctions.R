#Rfunctions



# ----------------------------------------------------------------------------
#  SIRPrediccion :
# ----------------------------------------------------------------------------
# Esta función devuelve un vector con el numero de contagios
# INPUT: p- una lista con los parametros
#        Tmax - Numero de tiempo
#        datos - Registro de los ultimos 14 dias  
# OUTPUT: Dataframe donde las filas es un tiempo dado y las columnas las variables 



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
  resultado
}

