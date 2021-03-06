require File.dirname(__FILE__) + '/../test_helper'

class CatalogControllerTest < ActionController::TestCase
  fixtures :directors, :producers, :films, :directors_films

    test "index" do
      get :index
      assert_response :success
      assert_tag :tag => 'dl', :attributes => { :id => 'films' },
                 :children => { :count => 5, :only => { :tag => 'dt' }}
      assert_tag :tag => 'dt', :content => 'The Idiot'
    end

    test "second_page" do
      get :index, :page => 2
      assert_response :success
      assert_template :index
      assert_equal Film.find_by_title('Pro Rails E-Commerce'),
                   assigns(:films).last
    end

  test "show" do
    Film.find_each do |a|
    	@film = Film.where(:title => a.title).first
    	get :show, :id => @film.id
    	assert_response :success
   	assert_template :show
   	assert_tag :tag => 'h1', :content => @film.title
    	assert_tag :tag => 'h2', :content => "by #{@film.directors.map{|a| a.name}.join(", ")}"
    end
  end

  test "latest_films" do
    get :latest
    assert_response :success
    assert_template :latest
    assert_tag :tag => 'dl', :attributes => { :id => 'films' },
               :children => { :count => 5, :only => { :tag => 'dt' } }
    @films = Film.latest(5)
    @films.each do |a|
      assert_tag :tag => 'dt', :content => a.title
    end
  end
end
