# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
	
require_relative "config/application"

Rails.application.load_tasks


task :ageHist => :environment do
  require 'rinruby'
  require 'pdftoimage'
  puts 'running...'
  r = RinRuby.new
  dataTable = CSV.parse(File.read("data/cBioPortal/pancreas.csv"))
  puts dataTable[0][3]
  array = Array.new
  x = 0
  while x < dataTable.size do
   # if dataTable[x][3].is_a? Integer
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
    img.resize('50%').save("rplot.jpg")
  end
  r.quit
end



task :rinrubyTest4 => :environment do
  require 'rinruby'
  require 'pdftoimage'
  require 'mutool'
  require 'docsplit'
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
  r.eval "plot(data2,data2)"
  r.quit
  r = RinRuby.new
  r.eval "print(ggplot(data2,data2))"

#  mutool clean "Rplots.pdf"
  images = PDFToImage.open("Rplots.pdf")  
  images.each do |img|
    img.resize('50%').save("done.jpg")
  end
 # r.eval "option(bitmapType='cairo')"
  #r.eval "png('rplot.png')"
  r.quit
  puts 'done'

 # EOF
end




task :readCSV => :environment do 
require 'csv'
puts 'running...'
x = 0
CSV.foreach("secondHalfGenes.csv", headers: true) do |row|
    Gene.create!(row.to_hash)
    x+=1
    if x%10 == 0 
      puts x
    end
  end
end


task :readMutationCSV => :environment do 
  require 'csv'
  puts 'running...'
  CSV.foreach("completeMutations.csv", headers: true) do |row|
      Meutation.create!(row.to_hash)
    end
  end


task :readImagesCSV => :environment do
  require 'csv'
  puts 'running...'
  CSV.foreach("images.csv", headers: true) do |row|
      Image.create!(row.to_hash)
    end
  end



task :readWebsCSV => :environment do
  require 'csv'
  puts 'running...'
  CSV.foreach("webs.csv", headers: true) do |row|
      Web.create!(row.to_hash)
  end
 end



task :readDrugsCSV => :environment do
  require 'csv'
  puts 'running...'
  CSV.foreach("drugs.csv", headers: true) do |row|
      Drug.create!(row.to_hash)
  end
end

task :integrateFrequencies => :environment do
  require 'csv'
  puts 'processing...'
  frequencyTable = CSV.parse(File.read("lymphNodeFrequencies.csv"), headers:true)
  puts frequencyTable
  forms = ["adrenal","bone marrow","bladder","brain","breast",
  "cervix","colorectal","esophagus","head and neck","kidney",
  "liver","lungs","ovary","pancreas","pleura","prostate","skin",
  "soft tissue","stomach","thyroid",
  "uterus","bile duct"]
  x = 0
  frequencyTable.each do |f|
    x+=1
    puts x
    gene = Gene.find_by(form: f[3], identity: f[0])
    if gene != nil
      gene.cFrequency = f[1]
      gene.gdcFrequency = f[2]
      gene.save
    end
  end 
end

task :updateDescriptions => :environment do
  require 'csv'
  puts "Processing..."

  geneTable = CSV.parse(File.read("updatedDescriptions.csv"), headers: true)
  #puts geneTable[0][0]
  forms = [#"adrenal","bone marrow","bladder","brain","breast",
  #"cervix","colorectal","esophagus","head and neck","kidney",
  #"liver","lungs","ovary","pancreas","pleura","prostate","skin",
  #"soft tissue","stomach","thyroid",
  "uterus","bile duct"]
  x = 0
  forms.each do |form|
    x=0
    puts "Processing genes for " + form + " cancer"
    geneTable.each do |newGene|
      if x%10 == 0
         puts x
      end
      gene = Gene.find_by(form: form, identity: newGene[0])
      if gene != nil
        #puts gene.information
        gene.name = newGene[1]
        gene.save
        #puts gene.information
        #puts gene.identity
        x+=1
      end
    end
  end
end

# task :importMutations => :environment do
#     require 'csv'
#     puts "Processing..."
#     #gene = Gene.find_by(identity: "KRAS")
#     #puts gene.identity
#     #gene.identity = "KRAS"
#     #gene.save
#     #puts gene.identity
  
#     geneTable = CSV.parse(File.read("mutations.csv"), headers: true)
#     puts geneTable[0][1]
#     forms = ["bone marrow",
#       #"bone marrow","bladder","brain","breast",
#     #"cervix","colorectal","esophagus","head and neck","kidney",
#     #"liver","lungs","ovary","pancreas","pleura","prostate","skin",
#     #"soft tissue","stomach","thyroid",
#     #"uterus","bile duct"
#   ]
#     x = 0
#     forms.each do |form|
#       x=0
#       puts "Processing genes for " + form + " cancer"
#       geneTable.each do |newGene|
#         if x%10 == 0
#            puts x
#         end
#         mutation = Mutation.find_by(form: form, identity: newGene[5])
#         #puts newGene[6]
#         if gene != nil
#           #puts gene.information
#           meutation.mutation = newGene[1]
#           meutation.mutationLocation = newGene[0]
#           meutation.detailedMutations = newGene[3]
#           meutation.resultant = newGene[4]
#           #.mutationsArray << newGene[4]  
#           meutation.save
#           #puts gene.information
#           #puts gene.identity
#           x+=1
#         end
#       end
#     end
#   end

task :condenseElements => :environment do  #I hope this works
  forms = ["adrenal","bone marrow","bladder","brain","breast",
    "cervix","colorectal","esophagus","head and neck","kidney",
    "liver","lungs","ovary",
  "pancreas","pleura","prostate","skin","soft tissue","stomach","thyroid","uterus","bile duct", "lymph nodes"]
  @genes = Gene.all
  formString = ""
  @genes.each do |gene|
    geneArray << gene.identity
  end
  geneArray.each do |testGene|
    forms.each do |form|
      gene = Gene.find_by(form: form, identity: testGene)
      if gene != nil
        formString += form + ", "
      end
    end
    gene.form = formString  #this is just changing form of  one gene. I need to create this new gene and delete all the others  
  end
end


task :deleteDuplicates => :environment do
  identicals = all.group_by{|gene| [gene.identity, gene.form]}
  identicals.values.each do |duplicates|
    keep = duplicates.shift

    duplicates.each{|copy| copy.destroy}
  end
end
  
