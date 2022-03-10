# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks

task :readCSV => :environment do 
require 'csv'
puts 'running...'
CSV.foreach("genes.csv", headers: true) do |row|
    Gene.create!(row.to_hash)
  end
end


task :readMutationCSV => :environment do 
  require 'csv'
  puts 'running...'
  CSV.foreach("serverGenes.csv", headers: true) do |row|
      Meutation.create!(row.to_hash)
    end
  end


task :updateDescriptions => :environment do
  require 'csv'
  puts "Processing..."
  #gene = Gene.find_by(identity: "KRAS")
  #puts gene.identity
  #gene.identity = "KRAS"
  #gene.save
  #puts gene.identity

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
  