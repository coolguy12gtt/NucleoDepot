desc 'generates histogram of distribution for number of mutations per patient'
task :mutationHist, :fileName do |t, args|
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
      if dataTable[0][counter].include? "Mutation Count"
        y = counter
        counter = dataTable[0].size + 1
      end
    end
  array = Array.new
  while x < dataTable.size do
    dataTable[x][y] = dataTable[x][y].to_i
    if dataTable[x][y] != 0
      if dataTable[x][y] < 1000
        array.push(dataTable[x][y])
      end
    end
    puts y
    x+=1
  end
  R.quit
  R = RinRuby.new
  R.mutation_count = array
  R.eval "hist(mutation_count)"
  R.quit
  R = RinRuby.new
  R.eval "print(gghist(mutation_count))"
  images = PDFToImage.open('Rplots.pdf')
  images.each do |img|
    img.resize('50%').save("app/assets/images/mutationCount.jpg")
  end
end

