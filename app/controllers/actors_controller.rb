class ActorsController < ApplicationController

  def show
    @actor = Actor.find(params[:id])
  end

  def create
    @movie = Movie.find(params[:movie_id])
    actor = Actor.new(actor_params)
    actor.movies = [@movie]
    if actor.save
      redirect_to "/movies/#{@movie.id}"
    else
      flash[:notice] = "Please enter name to add actor."
      render :new
    end
  end

  private
    def actor_params
      params.permit(:name, :age, :movies)
    end
end
