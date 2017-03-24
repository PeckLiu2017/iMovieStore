class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

     @movie.save
      redirect_to movies_path,notice:"Movie Added!"
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path,alert:"Movie Deleted"
  end

  def show
    @movies = Movie.find(params[:id])
  end
  
  private

  def movie_params
    params.require(:movie).permit(:title,:description)
  end
end
