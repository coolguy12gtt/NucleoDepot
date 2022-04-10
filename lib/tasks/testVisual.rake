
desc 'displays R graph on webpage'
task :testVisual do
  require 'rinruby'
  require 'pdftoimage'
  puts 'running...'
  r = RinRuby.new
  dataTable = CSV.parse(File.read("experiment.csv"))
  puts dataTable
  array = Array.new
  array2 = Array.new
  x = 0
  while x < 5 do
    array.push(dataTable[x][1])
    array2.push(dataTable[x][0])
    x += 1
  end
  r.data = array
  r.data2 = array2
 # r.eval <<EOF
  r.eval "plot(data,data2)"
  r.quit
  r = RinRuby.new
  r.eval "print(ggplot(data,data2))"
  images = PDFToImage.open('Rplots.pdf')
  images.each do |img|
    img.resize('50%').save("app/assets/images/rplotJpg.jpg")
  end
  #r.eval "option(bitmapType='cairo')"
  #r.eval "png('rplot3.png')"
  r.quit
  puts 'done'

 # EOF
end
  
