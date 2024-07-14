# ImagesSearcher

## Project Description
**ImagesSearcher** is an R script designed to automatically download images based on specific keywords, such as product barcodes, using Google Images as the search source.

## Features
- **Automatic Download**: Allows for image downloads using keywords defined in a text file (.txt), such as product codes.
- **Extension Filtering**: You can specify the desired image file extension (default: .jpg).
- **Automatic Organization**: Images are organized into two folders: "BASE" for previously downloaded images and "DESCARGA" for new downloads.
- **Duplicate Check**: Avoids downloading duplicate images by checking for existing codes in the "BASE" folder.

## Requirements
- R (3.0.0 or higher)
- Libraries: rvest, httr, digest

## Installation
1. Clone or download this repository.
2. Ensure R is installed on your system.
3. Install required libraries by running:
   ```R
   install.packages(c("rvest", "httr", "digest"))

## Usage

Data Preparation:

    Place product codes or other keywords in a text file (ITEMS.txt).

Running the Script:

    Execute the script from RStudio or R command line.
    Ensure you define directory paths for "BASE" and "DESCARGA" according to your setup.

source("ImagesSearcher.R")
directorio_destino <- "path/to/your/DESCARGA/directory"
codigos_a_buscar <- readLines("path/to/your/ITEMS.txt")
descargar_imagenes(codigos_a_buscar, directorio_destino)

Customization:

    Modify the code to change the file extension (nombre_archivo <- paste0(codigo, ".jpg")) or adjust other preferences as needed.

# Example 

Example ITEMS.txt File

product_code1
product_code2
product_code3

# Contribution

If you wish to contribute to this project, please create a pull request with your improvements.
