class MovieController < ApplicationController
  before_action :require_user, only: [:create, :new]
  def index
    # @user = current_user
    @movie = Movie.all
  end

  def new

  end

  def create
    if params[:movie][:url].blank?
      flash.now[:error] = 'Please enter url'
      render 'new'
    else
      movie = Movie.find_or_create_by!(url: movie_params[:url])
      current_user.user_movies.find_or_create_by(movie_id: movie.id)
      redirect_to root_path
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:url)
  end
end