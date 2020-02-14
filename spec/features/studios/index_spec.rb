require 'rails_helper'

RSpec.describe 'studio index page', type: :feature do

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
    end

    it 'should display movie names on studio index page' do
      visit '/studios'

      expect(page).to have_content("#{@studio_1.name}")
      expect(page).to have_content("#{@movie_1.name}")
      expect(page).to have_content("#{@movie_2.name}")
      expect(page).to have_content("#{@studio_2.name}")
      expect(page).to have_content("#{@movie_3.name}")
      expect(page).to have_content("#{@movie_4.name}")
    end

  end

end
