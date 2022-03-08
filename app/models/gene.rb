class Gene < ApplicationRecord
    has_many_attached :images
    serialize :mutationsArray,Array
end
