require 'csv'
class Product < ApplicationRecord
    has_one_attached :image
    def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
        Product.create! row.to_hash
    end
    scope :filter_by_brand, -> (brand) { where("brand like ?", "#{brand}%")}
    # scope :filter_by_price, -> (price) { where("brand like ?", "#{brand}%")}
end
end