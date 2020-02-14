require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :creation }
    it { should validate_presence_of :genre }
  end

  describe 'relationships' do
    it { should belong_to :studio}
    it { should have_many :actor_movies}
    it { should have_many(:actors).through(:actor_movies)}
  end

  describe 'movie methods' do
    before :each do
      @studio_1 = Studio.create(name: "A24")
      @studio_2 = Studio.create(name: "Warner Brothers")
      @movie_1 = Movie.create(name: "Parasite",
                              creation: "2019",
                              genre: "Horror",
                              studio_id: "#{@studio_1.id}")
      @movie_2 = Movie.create(name: "Titanic",
                              creation: "2000",
                              genre: "Drama",
                              studio_id: "#{@studio_1.id}")
      @movie_3 = Movie.create(name: "Get Out",
                              creation: "2016",
                              genre: "Horror",
                              studio_id: "#{@studio_2.id}")
      @movie_4 = Movie.create(name: "Toy Story",
                              creation: "1995",
                              genre: "Childrens",
                              studio_id: "#{@studio_2.id}")
      @actor_1 = Actor.create(name: "Tom Hanks",
                              age: 58,
                              movies: [@movie_2,@movie_4])
      @actor_2 = Actor.create(name: "Mr. Bean",
                              age: 42,
                              movies: [@movie_1,@movie_3])
      @actor_3 = Actor.create(name: "Hillary Duff",
                              age: 34,
                              movies: [@movie_2,@movie_3])
      @actor_4 = Actor.create(name: "Cher",
                              age: 80,
                              movies: [@movie_1,@movie_4])
    end

    it 'can sort actors by age' do
      expect(@movie_1.sort_actors.first).to eq(@actor_2)
      expect(@movie_1.sort_actors.last).to eq(@actor_4)
    end

    it 'can average actors age' do
      expect(@movie_1.average_age).to eq(61)
      expect(@movie_2.average_age).to eq(46)
    end
  end
end
