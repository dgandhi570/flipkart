# frozen_string_literal: true
require 'tempfile'
require 'rails_helper'

RSpec.describe Product, type: :model do
  # describe 'validations' do
  #   describe 'name' do
  #     it 'must be present' do
  #       product = described_class.new
  #       expect(product).to_not be_valid
  #     end
  #   end
  # end
  describe 'validation check' do 
  it 'has a name' do
    product = Product.new(name: "", brand: "whirlpool", description: "hbuygehyeyewb gevcwbh")
  
    expect(product).to_not be_valid
    product.name = "has a title"
    expect(product).to be_valid
  end
  end

  describe '#import' do 

    it 'creates products' do 
    file =  Tempfile.open(['products.csv', '.csv'])
    file << ['name', 'brand', 'price', 'description' ]   
    file << ['cocoa', 'wembley', 700, 'hbhnnhc  udbeueu bebd dbbdhbd s' ]   
      CSV.foreach(file.path, headers: true) do |row|
        Product.create row.to_hash
      expect(response).to be_successful
    end
  end
end

end
