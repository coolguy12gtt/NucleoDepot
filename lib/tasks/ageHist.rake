desc 'generates histogram of age at diagnosis'
task :ageHist do
  require 'rinruby'
  require 'pdftoimage'
  puts 'running...'
  r = RinRuby.new
  dataTable = CSV.parse(File.read("data/cBioPortal/pancreas.csv"))
  puts dataTable[0][3]
  array = Array.new
  x = 0
  while x < dataTable.size do
    array.push(dataTable[x][3].to_i)
    if array[x].is_a? Integer
      puts array[x]
    else
      puts "not and int"
    end
    x+=1
  end
  r.data = array
  r.eval "hist(data)"
  r.quit
  r = RinRuby.new
  r.eval "print(gghist(data))"
  images = PDFToImage.open('Rplots.pdf')
  images.each do |img|
    img.resize('50%').save("app/assets/images/rplot.jpg")
  end
  r.quit
end



