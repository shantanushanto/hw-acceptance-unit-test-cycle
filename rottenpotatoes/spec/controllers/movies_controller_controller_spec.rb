require 'rails_helper'
describe MoviesController do

    describe 'find a movie' do
        it 'should show the movie information' do
            movie = double('Movie')
            movie.stub(:title).and_return('Jurassic Park')
            movie.stub(:director).and_return('Director')
            Movie.should_receive(:find).with('1').and_return(movie)
            get :show, {:id => '1'}
            response.should render_template('show')
        end

        it 'should show correct movie information' do
            movie = double('Movie')
            movie.stub(:title).and_return('Jurassic Park')
            movie.stub(:director).and_return('Director')
            expect(movie.title).to eq('Jurassic Park')
            expect(movie.director).to eq('Director')
        end
    end 

    describe 'find similar movies' do 
        it 'should show other similar movies with the same director' do 
            movie = double('Movie')
            movie.stub(:title).and_return('Jurassic Park')
            movie.stub(:director).and_return('Director')
            Movie.should_receive(:find).with('1').and_return(movie)
            similar_movie = double('Movie')
            movie.stub(:title).and_return('Jurassic Park 2')
            movie.stub(:director).and_return('Director')
            Movie.should_receive(:find_directors_movies).with('1').and_return([movie, similar_movie])
            get :similar, {:id => "1"}
            response.should render_template('similar')
        end
    end 

end
