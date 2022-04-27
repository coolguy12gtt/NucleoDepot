desc 'generates scatterplot comparing number of genes mutated and fraction of genome altered'
task :genomeScatter, :fileName do |t, args|
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
  array1 = Array.new
  while x < dataTable.size do
    if dataTable[x][y] != 0
      array1.push(dataTable[x][y].to_f)
    end
    x+=1
  end
  
  x = 1
  y = 0
  counter = 0
    while counter < dataTable[0].size do
      counter += 1
      if dataTable[0][counter].include? "Mutation Count"
        y = counter
        counter = dataTable[0].size
      end
    end
  array2 = Array.new
  while x < dataTable.size do
    if dataTable[x][y] != 0
      array2.push(dataTable[x][y].to_f)
    end
    x+=1
  end

  counter = 0
  while counter < array1.size do
    if array1[counter] == 0
      array1.delete_at(counter)
      array2.delete_at(counter)
    end
    if array1[counter] == 0
      array1.delete_at(counter)
      array2.delete_at(counter)
    end
    counter += 1
  end  

  R.quit
  R = RinRuby.new
  R.fraction_genome_altered = array1
  R.mutation_count = array2
  R.eval "plot(fraction_genome_altered, mutation_count)"
  R.quit
  R = RinRuby.new
  R.eval "print(ggplot(fraction_genome_altered, mutation_count))"
  images = PDFToImage.open('Rplots.pdf')
  images.each do |img|
    img.resize('50%').save("app/assets/images/genomeScatter.jpg")
  end
end
end
