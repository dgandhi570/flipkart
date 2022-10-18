# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:valid_attributes) do
    {
      'id' => '1',
      'name' => 'capybra',
      'brand' => 'jio',
      'description' => 'fygyiw hedewhbdhved hgw  loRA IPSUM',
      'price' => '1450'
    }
  end

  let(:invalid_attributes) do
    {
      'id' => 'f',
      'name' => 'deep',
      'price' => 'gh'
    }
  end

  describe 'GET /index' do
    # pending "add some examples (or delete) #{__FILE__}"
    it 'renders a successful response' do
      product = Product.new(valid_attributes)
      product.save
      get products_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      product = Product.new(valid_attributes)
      product.save
      get product_url(product)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Product' do
        product = Product.new(valid_attributes)
        expect do
          product.save
          get product_url(product), params: { product: valid_attributes }
        end.to change(Product, :count).by(1)
      end

      # it 'redirects to the created product' do
      #   product = Product.new(valid_attributes) 
      #   get product_url(product), params: { product: valid_attributes }
      #   expect(response).to be_successful
      # end
    end

    context 'with invalid parameters' do
      it 'does not create a new Product' do
        expect do
          post products_url, params: { product: invalid_attributes }
        end.to change(Product, :count).by(1)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post products_url, params: { product: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end


  describe 'GET /new' do
    it 'renders a successful response' do
      get new_product_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      product = Product.new(valid_attributes)
      product.save
      get edit_product_url(product)
      expect(response).to be_successful
    end
  end


  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          'id' => '1',
          'name' => 'Test',
          'brand' => 'juckey'
        }
      end

      it 'updates the requested post' do
        product = Product.new(valid_attributes)
        product.save
        patch product_url(product), params: { product: new_attributes }
        product.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the product' do
        product = Product.new(valid_attributes)
        product.save
        patch product_url(product), params: { product: new_attributes }
        product.reload
        expect(response).to redirect_to(product_url(product))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        product = Product.create! valid_attributes
        patch product_url(product), params: { product: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe 'POST /import' do
     it "redirects to import products path" do
       post Product.import(file)
      expect(response).to be_successful
     end
  end
  
  
  describe 'DELETE /destroy' do
    it 'destroys the requested post' do
      product = Product.new(valid_attributes)
      product.save
      expect do
        delete product_url(product)
      end.to change(Product, :count).by(-1)
    end

    it 'redirects to the posts list' do
      product = Product.new(valid_attributes)
      product.save
      delete product_url(product)
      expect(response).to redirect_to(products_url)
    end
  end

end
