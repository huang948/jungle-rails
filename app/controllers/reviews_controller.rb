class ReviewsController < ApplicationController

    def create
        @review = Review.new(product_id: params[:review][:product_id], user_id: params[:review][:user_id], rating: params[:rating].to_i, description: params[:review][:description])
        @review.save!
        redirect_to product_path(params[:product_id])
    end

end