class Product < ApplicationRecord

        validates :title, presence: true
        validates :description, presence: false
        validates :price, numericality: {greater_than: 0}


        def self.filter_by_title(search)
            where("lower(title) Like ?", "%#{search.downcase}%")
        end
end