class SearchController < ApplicationController
  def index
        @products = Product.where(['name LIKE ?', "%#{params[:search_text]}%"])
        @products = @products.where(price: (params[:minprice]..params[:maxprice])) if (params[:minprice] || params[:maxprice]).present?

        if params[:sort].present?
            if params[:sort]== "l2h"
              @products = @products.sort_by(&:price)
            elsif params[:sort] == "h2l"
              @products = @products.sort_by(&:price).reverse
            elsif params[:sort] == "arrival"
              @products = @products.sort_by(&:created_at)
            end
        end
    
  end

end
  