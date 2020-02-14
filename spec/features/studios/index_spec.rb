require 'rails_helper'

RSpec.describe 'studio index page' type: :feature do

  context 'as a visitor' do

    before :each do
      @movie_1 = Movie.create(name: "Parasite",
                              creation: "2019",
                              genre: "Horror")
      @movie_2 = Movie.create(name: "Titanic",
                              creation: "2000",
                              genre: "Drama")
      @movie_3 = Movie.create(name: "Get Out",
                              creation: "2016",
                              genre: "Horror")
      @movie_4 = Movie.create(name: "Toy Story",
                              creation: "1995",
                              genre: "Childrens")
      @studio_1 = Studio.create(name: "A24")
      @studio_1 = Studio.create(name: "Warner Brothers")
    end

    it 'should display movie names on studio index page' do
      visit '/studios'

      expect(page).to have_content("A24")
      expect(page).to have_content("Parasite")
      expect(page).to have_content("Titanic")
      expect(page).to have_content("Warner Brothers")
      expect(page).to have_content("Get Out")
      expect(page).to have_content("Toy Story")
    end

  end

end
