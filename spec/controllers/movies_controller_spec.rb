require "rails_helper"

RSpec.describe MoviesController, type: :controller do
    describe 'same_director' do
        let(:movie) { FactoryGirl.create(:movie) }
        it 'call model method same_director' do
          #  allow(:Movie).to receive(:find).and_return(movie)
            expect_any_instance_of(Movie).to receive(:same_director).with(no_args)
            get :same_director, id: movie.id
        end
        # it 'render selected template' do
        #   get :same_director, id: movie.id
        #   expect(response).to render_template(:show)
        # end
        
        context "movie has a director" do
            let!(:movie2) { create(:movie, director: movie.director)}
            it do
                get :same_director, id: movie.id
                expect(response).to redirect_to(movie_path(movie2.id))
            end
        end
        
        context "movie has no director" do
            let(:movie2) { create(:movie, director: nil)}
            it 'redirected to root' do
                get :same_director, id: movie2.id
                expect(response).to redirect_to(root_url)
            end
            # it 'error message' do
            #      get :same_director, id: movie2.id
            #     expect(response.body).to have_content("'#{movie2.title}' has no information of director")
            # end
        end
    end    
end