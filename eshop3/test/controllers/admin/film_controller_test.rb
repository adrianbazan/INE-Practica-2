require File.dirname(__FILE__) + '/../../test_helper'  

class Admin::FilmControllerTest < ActionController::TestCase
  fixtures :directors, :producers, :films, :directors_films

  test "new" do
    get :new  
    assert_template 'admin/film/new'  
    assert_tag 'h1', :content => 'Crear nueva película'  
    assert_tag 'form', :attributes => { :action => '/admin/film/create?id=' }   
  end  

  test "create" do
    get :new    
    assert_template 'admin/film/new'
    assert_difference(Film, :count) do
      post :create, :film => {:title => 'Pro Rails E-Commerce', :producer_id => '1', :produced_at => '<%= Time.now.strftime("%Y-%m-%d") %>', :price => '45.0', :cod => '1234567890111', :blurb => 'describe1', :duration => '10'}
      assert_response :redirect
      assert_redirected_to :action => 'index'      
    end
    assert_equal 'Película Pro Rails E-Commerce creada con éxito.', flash[:notice]
  end

  test "edit" do
    get :edit, :id => 1
    assert_tag :tag => 'input', :attributes => { :name => 'film[title]', :value => 'Pro Rails E-Commerce' }
    assert_tag :tag => 'input', :attributes => { :name => 'film[price]', :value => '45.0' }
  end

  test "update" do
    post :update, :id => 1, :film => { :title => 'Pro Rails E-Commerce 2nd Edition', :price => '45.0' }
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
    assert_equal 'Pro Rails E-Commerce 2nd Edition', Film.find(1).title
  end

  test "test_destroy" do
    assert_difference(Film, :count, -1) do
      post :destroy, :id => 1
      assert_equal flash[:notice], 'Película Pro Rails E-Commerce eliminada con éxito.'
      assert_response :redirect
      assert_redirected_to :action => 'index'
      get :index
      assert_response :success
      assert_tag :tag => 'div', :attributes => {:id => 'notice'},
        :content => 'Película Pro Rails E-Commerce eliminada con éxito.'
    end
  end

  test "show" do
    get :show, :id => 1
    assert_template 'admin/film/show'
    assert_equal 'Pro Rails E-Commerce', assigns(:film).title
    assert_equal 45.0, assigns(:film).price
    assert_tag "h1", :content => Film.find(1).title
  end

  test "index" do
    get :index
    assert_response :success
    assert_tag :tag => 'table', :children => { :count => Film.count + 1, :only => {:tag => 'tr'} }
    Film.find_each do |a|
      assert_tag :tag => 'td', :content => a.name
    end
  end
end
