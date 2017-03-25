class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :movies
  has_many :reviews

  has_many :movie_relationships
  has_many :reviews_movies,:through => :movie_relationships, :source => :movie

  def is_member_of?(movie)
    reviews_movies.include?(movie)
  end

  def join!(movie)
    reviews_movies << movie
  end

  def quit!(movie)
    reviews_movies.delete(movie)
  end
end
