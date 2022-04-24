desc 'generates histogram of age at diagnosis'
task :ageHist, :fileName do |t, args|
  require 'rinruby'
  require 'pdftoimage'
  puts 'running...'
  name = args.fileName
  if not(name.equal?("breast")) && not(name.equal?("nervous system"))
  dataTable = CSV.parse(File.read("data/cBioPortal/#{name}.csv"))
  x = 1
  y = 0
  counter = 0
  while counter < dataTable[0].size do
    counter += 1
    if dataTable[0][counter].include? "ge"
      y = counter
      counter = dataTable[0].size + 1
    end
  end
  array = Array.new
  while x < dataTable.size do
    dataTable[x][y] = dataTable[x][y].to_i
    if dataTable[x][y] != 0
      array.push(dataTable[x][y])
    end
    puts y
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
    img.resize('50%').save("app/assets/images/ageHist.jpg")
  end
end
end
