desc 'generates histogram of age at diagnosis'
task :relapseFreq, :fileName do |t, args|
  require 'rinruby'
  require 'pdftoimage'
  puts 'running...'
  name = args.fileName
  dataTable = CSV.parse(File.read("data/cBioPortal/#{name}.csv"))
  x = 1
  y = 0
  counter = 0
  while counter < dataTable[0].size do
    counter += 1
    if dataTable[0][counter].include? "utcome"
      y = counter
      counter = dataTable[0].size + 1
    end
  end
  array = Array.new
  while x < dataTable.size do
    if not(dataTable[x][y].eql?("NA"))
      array.push(dataTable[x][y])
    end
    puts y
    x+=1
  end
  R.quit
  R = RinRuby.new
  R.relapse = array
  R.eval "hist(relapse)"
  R.quit
  R = RinRuby.new
  R.eval "print(gghist(relapse))"
  images = PDFToImage.open('Rplots.pdf')
  images.each do |img|
    img.resize('50%').save("app/assets/images/relapseFreq.jpg")
  end
end
