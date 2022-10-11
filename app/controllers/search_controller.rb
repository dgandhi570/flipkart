class SearchController < ApplicationController
  def index
    @products = Product.where(['name LIKE ?', "%#{params[:search_text]}%"])
    @products = @products.filter_by_brand(params[:brand]) if params[:brand].present?
    









    
    # if params[:sort] == "l2h"
    #   @products = Product.where(['name LIKE ?', "%#{params[:search_text]}%"]).sort_by(&:price)
    # elsif params[:sort] == "h2l"
    #   @products = Product.where(['name LIKE ?', "%#{params[:search_text]}%"]).sort_by(&:price).reverse
    # elsif params[:sort] == "arrival"
    #   @products = Product.where(['name LIKE ?', "%#{params[:search_text]}%"]).sort_by(&:created_at)
    # else
    #   @products = Product.where(['name LIKE ?', "%#{params[:search_text]}%"])
    # end
    
  end

end
  