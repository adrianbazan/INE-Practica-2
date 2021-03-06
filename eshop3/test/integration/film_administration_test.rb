require 'test_helper'

class FilmAdministrationTestTest < ActionDispatch::IntegrationTest

  test "film_aministration" do
    producer = Producer.create(:name => 'Books of Ruby')
    director = Director.create(:first_name => 'John', :last_name => 'Anderson')
    george = new_session_as(:george)

    new_film_ruby = george.add_film :film => {
      :title => 'A new Book of Ruby',
      :producer_id => producer.id,
      :director_ids => [director.id],
      :produced_at => Time.now,
      :cod => '150',
      :blurb => 'A new Book of Ruby',
      :duration => 325,
      :price => 45.5
    }

    george.list_films
    george.show_film new_film_ruby

    george.edit_film new_film_ruby, :film => {
      :title => 'A very new Book of Ruby',
      :producer_id => producer.id,
      :director_ids => [director.id],
      :produced_at => Time.now,
      :cod => '160',
      :blurb => 'A very new Book of Ruby',
      :duration => 350,
      :price => 50
    }

    bob = new_session_as(:bob)
    bob.delete_film new_film_ruby
  end

  private

  module FilmTestDSL
    attr_writer :name

    def add_film(parameters)
      director = Director.first
      producer = Producer.first
      get '/admin/film/new'
      assert_response :success
      assert_template 'admin/film/new'
      assert_tag :tag => 'option', :attributes => { :value => producer.id }
      assert_tag :tag => 'select', :attributes => { :name => 'film[director_ids][]' }
      post '/admin/film/create', parameters
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_template 'admin/film/index'
      page = Film.all.count / 5 + 1
      get "/admin/film/index/?page=#{page}"
      assert_tag :tag => 'td', :content => parameters[:film][:title]
      film = Film.find_by_title(parameters[:film][:title])
      return film;
    end

    def edit_film(film, parameters)
      get "admin/film/edit?id=#{film.id}"
      assert_response :success
      assert_template 'admin/film/edit'
      post "/admin/film/update?id=#{film.id}", parameters
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_template 'admin/film/show'
    end

    def delete_film(film)
      post "/admin/film/destroy?id=#{film.id}"
      assert_response :redirect
      follow_redirect!
      assert_template 'admin/film/index'
    end

    def show_film(film)
      get "/admin/film/show/#{film.id}"
      assert_response :success
      assert_template 'admin/film/show'
    end

    def list_films
      get 'admin/film/index'
      assert_response :success
      assert_template 'admin/film/index'
    end
  end

  def new_session_as(name)
    open_session do |session|
      session.extend(FilmTestDSL)
      session.name = name
      yield session if block_given?
    end
  end
end
