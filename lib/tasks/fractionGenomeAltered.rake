desc 'generates histogram of distribution of fraction of genome altered'
task :fractionGenomeAltered, :fileName do |t, args|
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
      if dataTable[0][counter].include? "Fraction Genome"
        y = counter
        counter = dataTable[0].size + 1
      end
    end
  array = Array.new
  while x < dataTable.size do
    if dataTable[x][y] != 0
      array.push(dataTable[x][y].to_f)
    end
    x+=1
  end

  counter = 0
  while x < array.size do
    if array[counter] == 0
      array.delete_at(counter)
    end
  end

  R.quit
  R = RinRuby.new
  R.fraction_genome_altered = array
  R.eval "hist(fraction_genome_altered)"
  R.quit
  R = RinRuby.new
  R.eval "print(gghist(fraction_genome_altered))"
  images = PDFToImage.open('Rplots.pdf')
  images.each do |img|
    img.resize('50%').save("app/assets/images/fractionGenomeAltered.jpg")
  end
end
end
