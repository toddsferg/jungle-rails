class ProductsController < ApplicationController

  def index #action view to views folder
    @products = Product.all.order(created_at: :desc)
  end

  def show #action vie
    @product = Product.find params[:id]
  end

end
