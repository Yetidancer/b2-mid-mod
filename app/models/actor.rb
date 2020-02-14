class Actor < ApplicationRecord
  validates_presence_of :name, :age
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def coworker_movies
    movies.joins(:actor_movies).uniq
  end

  def coworkers
    coworker_movies
  end
end
