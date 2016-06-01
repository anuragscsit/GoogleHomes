class ReviewsController < ApplicationController
  before_filter :authenticate_user!

  def new
  	review = Review.new
  end

  
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to tenant_tenants_dashboard_path, notice: 'Review was successfully created.' }
      
      else
        format.html { redirect_to tenant_tenants_dashboard_path, notice: 'Something went wrong!' }
      end
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.require(:review).permit(:message, :tenant_id, :house_id)
  end

  def show
  end

end
