require "rails_helper"

RSpec.describe  Movie  do
    describe '#same_director' do
        context 'find all movies with the same director' do
            let!(:movie1) { create(:movie, director: 'Dir1')}
            let!(:movie2) { create(:movie, director: 'Dir1')}
            let!(:movie3) { create(:movie, director: 'Dir3')}
            
            subject {movie1.same_director}
            it {expect(subject).to eq(movie2)}
            it {expect(subject).not_to match(movie3)}
        end
    end
end 