require "rails_helper"

RSpec.describe MoviesController, type: :controller do
  
    context 'when movie has director' do
        it 'renders same director page' do
            movie_1 = Movie.create(:title => "Dark Knight", :director => "Christopher Nolan")
            movie_2 = Movie.create(:title => "Joker", :director => "Todd Phillips")

            get :samedirector, :id => movie_1

            expect(response).to render_template("samedirector")
        end
    end

    context 'when movie has no director' do
        it 'renders index page' do
            movie_1 = Movie.create(:title => "Dark Knight")

            get :samedirector, :id => movie_1

            expect(response).to redirect_to('/movies')
            expect(flash[:notice]).to eq("\'Dark Knight\' has no director info")
        end
    end
end