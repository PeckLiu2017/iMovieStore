class MoviesController < ApplicationController
  before_action :authenticate_user! ,only: [:new,:create]
  before_action :find_movie_and_check_permission,only:[:new,:update,:destroy]
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    if @movie.save
      current_user.join!(@movie)
      redirect_to movies_path,notice:"Movie Added!"
    else
      render :new
    end
  end

  def destroy
    find_movie_and_check_permission
    @movie.destroy
    redirect_to movies_path,alert:"Movie Deleted"
  end

  def edit
    find_movie_and_check_permission
  end

  def update
    find_movie_and_check_permission
    if @movie.update(movie_params)
      redirect_to movies_path,notice:"Movie Updated!"
    else
      render :edit
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews.recent.paginate(:page => params[:page], :per_page =>5)
  end

    def join
     @movie = Movie.find(params[:id])

      if !current_user.is_member_of?(@movie)
        current_user.join!(@movie)
        flash[:notice] = "Favorite it success!"
      else
        flash[:warning] = "You have already favorited it!"
      end

      redirect_to movie_path(@movie)
    end

    def quit
      @movie = Movie.find(params[:id])

      if current_user.is_member_of?(@movie)
        current_user.quit!(@movie)
        flash[:alert] = "You have already removed it form favorite list！"
      else
        flash[:warning] = "You didn't favorite it!"
      end

      redirect_to movie_path(@movie)
    end

  private

  def find_movie_and_check_permission
    @movie = Movie.find(params[:id])
    if current_user != @movie.user
     redirect_to root_path, alert: "You have no permission."
   end
  end
  def movie_params
    params.require(:movie).permit(:title,:description)
  end
end
