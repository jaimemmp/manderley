require 'spec_helper'

feature 'Movie management' do
    scenario "adds a new movie" do

        visit new_movie_path

        fill_in 'movie_title', with: "Jumanjii"
        fill_in 'movie_duration', with: 120
        fill_in 'movie_synopsis', with: "Lorem ipsum dolor sit amet"
        fill_in 'movie_year', with: 1995

        expect { click_button 'Create Movie' }.to change(Movie, :count).by(1)

    end
end