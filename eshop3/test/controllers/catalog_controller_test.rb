require File.dirname(__FILE__) + '/../test_helper'  

class CatalogControllerTest < ActionController::TestCase
  fixtures :directors, :producers, :films, :directors_films

  test "show" do
    get :show, :id => 1
    assert_template 'catalog/show'
    assert_equal 'Pro Rails E-Commerce', assigns(:film).title
    assert_tag "h1", :content => Film.find(1).title
  end
  test "index" do
    get :index
    assert_response :success
    assert_tag :tag => 'dl', :attributes => {:id => 'films'}, :children => { :count => Film.count+1, :only => { :tag => 'dt' } }

    Film.find_each do |a|
      assert_tag :tag => 'dd', :content => a.title
    end
  end
  test "latest" do
    get :latest
    assert_response :success
    assert_tag :tag => 'dl', :attributes => {:id => 'films'}, :children => { :count => 5, :only => { :tag => 'dt' } }
  end
end
