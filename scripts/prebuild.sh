for FILE in $(find ./src/static -name "*.svg"); do
    resvg $FILE --zoom=4 --dpi=1200 ${FILE/.svg/.png}
done