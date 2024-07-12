# ImagesSearcher

This script allows you to place a series of words in a .txt (in my particular case I used product barcodes), and use Google to download the best match that corresponds to the cited word.

# Function

- The script uses the rvest, httr and digest libraries.
- The image searching is via https://www.google.com/search?q=
- The searching will only involve .jpg files, but in case you want another extension, you can change the line "nombre_archivo <- paste0(codigo, ".jpg")"
- The script will let you know if some image is already written in your folder "BASE" and will put the new files in the folder "DESCARGA".

# Notes

- I upload an ITEM.txt file as an example.
- I also upload a .bat file to program it on the task manager.
