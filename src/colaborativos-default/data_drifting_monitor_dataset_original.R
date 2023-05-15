install.packages("DriftR")
library(DriftR)

# Importar conjunto de datos
competencia_frame <- read.csv("C:\Users\Gonzalo\Documents\Laboratorio de implementacion\datasets\dataset_pequeno.csv")

# Especificar la columna de tiempo
time_column <- "foto_mes"

# Crear un objeto Report
report <- Report(metrics = list(DataDriftPreset()))

# Dividir el conjunto de datos en intervalos de tiempo y calcular la deriva de datos
for (i in seq(1, nrow(competencia_frame), by = 1)) {
  window_data <- competencia_frame[i:(i+6), ]
  drift_report <- report$detect_drift(current_data = window_data, reference_data = NULL, column_mapping = NULL)
  
  # Imprimir el informe de deriva de datos para cada intervalo de tiempo
  print(drift_report)
}
