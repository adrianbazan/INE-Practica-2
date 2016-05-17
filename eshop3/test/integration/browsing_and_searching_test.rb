require 'test_helper'

class BrowsingAndSearchingTestTest < ActionDispatch::IntegrationTest
  fixtures :producers, :directors, :films, :directors_films

  test "browse" do
    jill = new_session_as :jill
    jill.index
    jill.second_page
    jill.film_details 'Pride and Prejudice'
    jill.latest_films
  end

  module BrowsingTestDSL
    include ERB::Util
    attr_writer :name

    def index
      get 'catalog/index'
      assert_response :success
      assert_tag :tag => 'dl', :attributes => { :id => 'films' },
                 :children => { :count => 5, :only => { :tag => 'dt' }}
      assert_tag :tag => 'dt', :content => 'The Idiot'
      check_film_links
    end

    def second_page
      get 'catalog/index?page=2'
      assert_response :success
      assert_template 'catalog/index'
      assert_equal Film.find_by_title('Pro Rails E-Commerce'),
                   assigns(:films).last
      check_film_links
    end

    def film_details(title)
      @film = Film.where(:title => title).first
      get "catalog/show/#{@film.id}"
      assert_response :success
      assert_template 'catalog/show'
      assert_tag :tag => 'h1', :content => @film.title
      assert_tag :tag => 'h2', :content => "by #{@film.directors.map{|a| a.name}.join(", ")}"
    end

    def check_film_links
      for film in assigns :films
        assert_tag :tag => 'a', :attributes => { :href => "/catalog/show/#{film.id}" }
      end
    end

    def latest_films
      get 'catalog/latest'
      assert_response :success
      assert_template 'catalog/latest'
      assert_tag :tag => 'dl', :attributes => { :id => 'films' },
                 :children => { :count => 5, :only => { :tag => 'dt' } }
      @films = Film.latest(5)
      @films.each do |a|
        assert_tag :tag => 'dt', :content => a.title
      end
    end

    def rss
      get 'catalog/rss'
      assert_response :success
      assert_template 'catalog/rss'
      assert_tag :tag => 'channel', :children => { :count => 5, :only => { :tag => 'item' } }
      @films = Film.latest(5)
      @films.each do |a|
          assert_tag :tag => 'dt', :content => a.title
      end
    end
  end

  def new_session_as(name)
    open_session do |session|
      session.extend(BrowsingTestDSL)
      session.name = name
      yield session if block_given?
    end
  end
end
