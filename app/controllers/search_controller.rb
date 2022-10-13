# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @products = Product.where(['name LIKE ?', "%#{params[:search_text]}%"])
    if (params[:minprice] || params[:maxprice]).present?
      @products = @products.where(price: (params[:minprice]..params[:maxprice]))
    end

    if params[:sort].present?
      case params[:sort]
      when 'l2h'
        @products = @products.sort_by(&:price)
      when 'h2l'
        @products = @products.sort_by(&:price).reverse
      when 'arrival'
        @products = @products.sort_by(&:created_at)
      end
    end
  end
end
