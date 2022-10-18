# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show; end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  def searchpage; end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Post was successfully created." }
        # format.turbo_stream do
        #   render turbo_stream: turbo_stream.prepend('products', partial: 'products/product',
        #                                                         locals: { product: @product })
        # end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Post was successfully created." }
        # format.turbo_stream do
        #   render turbo_stream: turbo_stream.replace(@product, partial: 'products/product',
        #                                                       locals: { product: @product })
        # end

      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    if params[:file].present?
      Product.import(params[:file])
      redirect_to products_path, notice: 'Products Added Sucessfully'
    else
      redirect_to products_path, hh: 'Select the file first'
    end
  end

  # def search
  #   @products = if params[:search_text].present?
  #                 if params[:search_text] == '@'
  #                   Product.all
  #                 else
  #                   Product.where(['name LIKE ?', "%#{params[:search_text]}%"])
  #                 end
  #               else
  #                 []
  #               end
  #   respond_to do |format|
  #     format.turbo_stream do
  #       render turbo_stream: turbo_stream.update('search_results', partial: 'shared/searchResults')
  #     end
  #   end
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :brand, :description, :price, :image)
  end
end
