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
    
    
    context 'Movie Title on home clicked' do
        it 'should hilite title header' do
          get :index, { sort: 'title'}
          expect(assigns(:title_header)).to eql('hilite')
        end
    end
    
    context 'Released Date on home clicked' do
        it 'should hilite release date header' do
          get :index, { sort: 'release_date'}
          expect(assigns(:date_header)).to eql('hilite')
        end
    end
    
    context 'Director on home clicked' do
        it 'should hilite director header' do
          get :index, { sort: 'director'}
          expect(assigns(:director_header)).to eql('hilite')
        end
    end
    
   
    context 'show Movie' do
        it 'renders show details page' do
            movie_1 = Movie.create(:title => "Interstellar", :director => "Christopher Nolan")
            get :show, :id => movie_1
            expect(response).to render_template("show")
            
        end
    end
    
    context 'Delete a Movie' do
        it 'flashes delete message' do
            movie_1 = Movie.create(:title => "Inception", :director => "Christopher Nolan")
            get :destroy, :id => movie_1
            expect(response).to redirect_to(movies_path)
            expect(flash[:notice]).to eq("Movie \'Inception\' deleted.")
        end
    end
    
    
    
end