# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @products = Product.where(['name LIKE ?', "%#{params[:search_text]}%"])
    @products = @products.where(price: (params[:minprice]..params[:maxprice])) if (params[:minprice] || params[:maxprice]).present?

    return unless params[:sort].present? do
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
