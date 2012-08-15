require 'spec_helper'

describe "Movies" do
  describe "GET /movies" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get movies_path
      response.status.should be(200)
    end
  end
	
  describe "Home page" do
	it "should have the content 'All Movies'" do
		visit '/movies/new'
		page.should have_content('Create New Movie')
	end
  end

  describe "Help page" do
	it "should have the h1 'Help'" do
		visit '/help/help'
		page.should have_selector('h1', :text => 'Help')
	end

	it "should have the title 'Help'" do
		visit '/help/help'
		page.should have_selector('title',	:text => "Ruby on Rails Tutorial Sample App | Help")
	end
  end
	
  describe "About page" do
	it "should have the h1 'About Us'" do
		visit '/help/about'
		page.should have_selector('h1', :text => 'About Us')
	end

	it "should have the title 'About Us'" do
		visit '/help/about'
		page.should have_selector('title',	:text => "Ruby on Rails Tutorial Sample App | About Us")
	end
 end

=begin
 describe 'searching Tmdb by keyword' do
    context 'with valid key' do
      it 'should call Tmdb with title keywords given valid API key' do
        TmdbMovie.should_receive(:find).
          with(hash_including :title => 'Inception')
        Movie.find_in_tmdb('Inception')
      end
    end
    context 'with invalid key' do
      it 'should raise InvalidKeyError if key not given' do
        Movie.stub(:api_key).and_return('')
        lambda { Movie.find_in_tmdb('Inception') }.
          should raise_error(Movie::InvalidKeyError)
      end
      it 'should raise InvalidKeyError if key is bad' do
        TmdbMovie.stub(:find).
          and_raise(RuntimeError.new('API returned code 404'))
        lambda { Movie.find_in_tmdb('Inception') }.
          should raise_error(Movie::InvalidKeyError)
      end
    end
  end
=end

end




