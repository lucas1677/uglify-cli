uglify(){
  echo "Please input the folder to compress:"
  read compressPath
  
  #minification of JS files
  find $compressPath -type f \
    -name '*.js' ! -name '*.min.*' ! -name 'vfs_fonts*' ! -name '*engine*' \
    -exec echo "Compressing: "{} \; \
    -exec uglifyjs -mc -o {}.min {} \; \
    -exec rm {} \; \
    -exec mv {}.min {} \;

  #minification of CSS files
  find $compressPath -type f \
    -name '*.css' ! -name '*.min.*' \
    -exec echo "Compressing: "{} \; \
    -exec uglifycss --output {}.min {} \; \
    -exec rm {} \; \
    -exec mv {}.min {} \;

  echo "Succeed at compressing $compressPath XD! Only js & css file compressed!"
}
