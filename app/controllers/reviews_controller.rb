class ReviewsController < ApplicationController
  before_action :set_user, only: %i[index]
  before_action :set_review, only: %i[destroy data]
  before_action :require_login, only: %i[create]
  before_action :require_owner, only: %i[destroy edit update]

  def index
    @reviews = @user.reviews
  end

  def create
    review = Review.new(review_params)
    review.save
    # If this fails, view already exists
    View.create(viewer: review.reviewer, medium: review.medium)
    return redirect_back fallback_location: medium_path(review.medium), notice: review.errors unless review.errors.blank?

    redirect_to medium_path(review.medium)
  end

  def edit; end

  def update
    @review.update(review_params)
    return redirect_to edit_review_path(@review), notice: @review.errors unless @review.errors.blank?

    redirect_to medium_path(@review.medium)
  end

  def destroy
    @review.destroy
    redirect_back fallback_location: root_path
  end

  def data
    render json: @review
  end
  
  private

  def review_params
    params.require(:review).permit(:content, :rating, :medium_id, :user_id)
  end

  def require_owner
    return head(:forbidden) unless current_user == @review&.reviewer
  end

  def set_review
    @review = Review.find_by(id: params[:id])
  end
end
