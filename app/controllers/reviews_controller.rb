class ReviewsController < ApplicationController
    before_action :find_house
    
    def new
        @review = Review.new
    end
    
    def create
        @review = Review.new(review_params)
        @review.house_id = @house.id
        @review.user_id = current_user.id
        if @review.save
            redirect_to house_path(@house)
        else
            render 'new'
        end
    end
    
    private
    def review_params
        params.require(:review).permit(:rating,:comment)
    end
    
    def find_house
        @house = House.find(params[:house_id])
    end
end