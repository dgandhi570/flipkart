# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @products = Product.where(['name LIKE ?', "%#{params[:search_text]}%"])
    @products = @products.where(price: (params[:minprice]..params[:maxprice])) if (params[:minprice] || params[:maxprice]).present?

    return unless params[:sort].present? do
                    case params[:sort]
                    when 'price:low_to_high'
                      @products = @products.sort_by(&:price)
                    when 'price:high_to_low'
                      @products = @products.sort_by(&:price).reverse
                    when 'newly_added'
                      @products = @products.sort_by(&:created_at)
                    end
                  end
  end
end
 