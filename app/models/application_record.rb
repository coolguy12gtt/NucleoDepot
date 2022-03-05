class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  #attr_accessible :identity, :form, :name
  def self.to_csv
      require 'csv'
      CSV.generate do |csv|
         csv << column_names
         all.each do |gene|
          csv << gene.attributes.values_at(*column_names)
         end
        end
    end
end
