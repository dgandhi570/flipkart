# frozen_string_literal: true

require 'csv'
class Product < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Product.create! row.to_hash
    end
  end
end
