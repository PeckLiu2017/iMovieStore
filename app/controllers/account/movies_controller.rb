class Account::MoviesController < ApplicationController
  before_action :authenticate_user!
  def index
    @movies = current_user.reviews_movies
  end
end
