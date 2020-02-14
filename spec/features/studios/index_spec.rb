require 'rails_helper'

RSpec.describe 'studio index page' type: :feature do

  context 'as a visitor' do

    before :each do
      @movie_1 = Movie.create(name: "Parasite",
                              creation: "2019",
                              genre: "Horror")
    end

  end

end
