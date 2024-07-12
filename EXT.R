#Cargar las librerias necesarias
library(rvest)
library(httr)
library(digest)

#Funcion para descargar imagenes
descargar_imagenes <- function(codigos, carpeta_destino) {
  for (codigo in codigos) {
    # Verificar si el código ya existe en el directorio BASE
    if (file.exists(file.path("C:/Users/3568528/Desktop/Directorio/56_Imagenes_Encuestas/BASE", paste0(codigo, ".jpg")))) {
      cat("El codigo", codigo, "ya existe en el directorio BASE. Se omite la busqueda.\n")
      next
    }
    
    # Definir la URL de busqueda para el código de producto
    url <- paste0("https://www.google.com/search?q=", codigo, "&tbm=isch")
    
    # Realizar la solicitud GET a la URL
    respuesta <- httr::GET(url)
    
    # Verificar si la solicitud fue exitosa
    if (httr::http_error(respuesta)) {
      cat("Error al realizar la solicitud GET:", httr::http_status(respuesta), "\n")
      next
    }
    
    # Extraer el contenido HTML de la respuesta
    contenido_html <- httr::content(respuesta, "text")
    
    # Parsear el contenido HTML
    documento_html <- rvest::read_html(contenido_html)
    
    # Extraer los enlaces de las imágenes
    enlaces_imagenes <- documento_html %>%
      rvest::html_nodes("img") %>%
      rvest::html_attr("src")
    
    # Filtrar los enlaces de las imágenes que contienen "http"
    enlaces_imagenes <- enlaces_imagenes[grep("^http", enlaces_imagenes)]
    
    # Verificar si se encontraron enlaces de imágenes
    if (length(enlaces_imagenes) == 0) {
      cat("No se encontraron imágenes para el codigo:", codigo, "\n")
      next
    }
    
    # Descargar la primera imagen solamente y guardarla en la carpeta de destino
    nombre_archivo <- paste0(codigo, ".jpg")
    ruta_archivo <- file.path(carpeta_destino, nombre_archivo)
    httr::GET(enlaces_imagenes[1], httr::write_disk(ruta_archivo, overwrite = TRUE))
    cat("Imagen descargada para el codigo:", codigo, "\n")
  }
}

# Directorio de destino donde guardar las imagenes descargadas
directorio_destino <- "C:/Users/3568528/Desktop/Directorio/56_Imagenes_Encuestas/DESCARGA"

# Leer los codigos desde el archivo ITEMS.txt
codigos_a_buscar <- readLines("C:/Users/3568528/Desktop/Directorio/56_Imagenes_Encuestas/ITEMS.txt")

# Descargar imagenes solo para los codigos que no existen en el directorio BASE
cat("Descargando imagenes...\n")
descargar_imagenes(codigos_a_buscar, directorio_destino)

