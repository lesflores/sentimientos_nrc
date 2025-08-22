# ---- MINI análisis de sentimientos
# con NRC en español  

library(syuzhet)
library(tidytext)
library(dplyr)

# Supongamos recibiste respuestas abiertas
respuestas <- data.frame(
  texto = c(
    "El servicio de agua es excelente",
    "Me siento seguro en mi colonia",
    "La iluminación pública es pobre",
    "La policía es corrupta",
    "Gran apoyo del municipio",
    "Terrible experiencia con el gobierno",
    "Amo el nuevo programa de seguridad",
    "Hay mucha burocracia",
    "El gobierno es transparente"
  )
)

# Paso 1 Extraer todas las palabras (tokenizar)
tokens <- respuestas %>%
  unnest_tokens(palabra, texto)

# Paso 2 Sentimientos NRC en español
emociones <- get_nrc_sentiment(tokens$palabra, language = "spanish")

# Paso 3 Resultado de emociones 
resumen_emociones <- bind_cols(tokens, emociones) %>%
  select(-palabra) %>%
  summarise_all(sum)

resumen_emociones
#anger anticipation disgust fear joy sadness surprise trust negative positive
