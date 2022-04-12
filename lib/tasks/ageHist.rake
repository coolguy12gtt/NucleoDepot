desc 'generates histogram of age at diagnosis'
task :ageHist, :fileName do |t, args|
  require 'rinruby'
  require 'pdftoimage'
  puts 'running...' 
  name = args.fileName
  dataTable = CSV.parse(File.read("data/cBioPortal/#{name}.csv"))
  puts dataTable[0][3]
  array = Array.new
  x = 1
  while x < dataTable.size do
    dataTable[x][3] = dataTable[x][3].to_i
    if dataTable[x][3] != 0
      array.push(dataTable[x][3])
    end
    puts dataTable[x][3]
    x+=1
  end
  R.quit
  R = RinRuby.new
  R.age_of_diagnosis = array
  R.eval "hist(age_of_diagnosis)"
  R.quit
  R = RinRuby.new
  R.eval "print(gghist(age_of_diagnosis))"
  images = PDFToImage.open('Rplots.pdf')
  images.each do |img|
    img.resize('50%').save("app/assets/images/rplot.jpg")
  end
end



