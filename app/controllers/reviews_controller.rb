class ReviewsController < ApplicationController

    before_action :require_login

  def create
    puts "++++++==================="
    puts params.inspect


    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to @product
    else

      # flash[:error] = @review.errors.full_messages[0]
      redirect_to @product
    end

  end

   def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end


private

  def review_params
    params.require(:review).permit(:rating, :description)
  end

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to review this product"
      redirect_to Product.find(params[:product_id])
    end
    # raise "Yay, I'm here!"
  end

end
