require 'rails_helper'

RSpec.describe 'actor show page', type: :feature do

  context 'as a visitor' do

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
    it 'should display actor stats and movies on actor show page.' do
      visit "/movies/#{@movie_1.id}"

      expect(page).to have_content(@movie_1.name)
      expect(page).to have_content(@movie_1.creation)
      expect(page).to have_content(@movie_1.genre)
      expect(page).to have_content(@actor_2.name)
      expect(page).to have_content(@actor_4.name)
      expect(page).to have_content(61)

    end

    it 'should be able to add actor.' do
      visit "/movies/#{@movie_1.id}"
      expect(page).to have_content("Name:")
      fill_in :name, with: "Yogi Bear"
      click_on "Add Actor"
      expect(current_path).to eq("/movies/#{@movie_1.id}")
      expect(page).to have_content("Yogi Bear")
    end

  end
end
