# frozen_string_literal: true

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

  it 'has a name' do
    product = Product.new(name: "", brand: "whirlpool", description: "hbuygehyeyewb gevcwbh")
  
    expect(product).to_not be_valid
    product.name = "has a title"
    expect(product).to be_valid
  
  end

end
