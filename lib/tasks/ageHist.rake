desc 'generates histogram of age at diagnosis'
task :ageHist, :fileName do |t, args|
  require 'rinruby'
  require 'pdftoimage'
  puts 'running...'
  name = args.fileName
  r = RinRuby.new
  dataTable = CSV.parse(File.read("data/cBioPortal/#{name}.csv"))
  puts dataTable[0][3]
  array = Array.new
  x = 1
  while x < dataTable.size do
    array.push(dataTable[x][3].to_i)
    if array[x].is_a? Integer
      puts array[x]
    else
      puts "not and int"
    end
    x+=1
  end
  r.age_of_diagnosis = array
  r.eval "hist(age_of_diagnosis)"
  r.quit
  r = RinRuby.new
  r.eval "print(gghist(age_of_diagnosis))"
  images = PDFToImage.open('Rplots.pdf')
  images.each do |img|
    img.resize('50%').save("app/assets/images/rplot.jpg")
  end
  r.quit
end



