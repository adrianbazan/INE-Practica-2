require File.dirname(__FILE__) + '/../../test_helper'  

class Admin::DirectorControllerTest < ActionController::TestCase
  fixtures :directors

  test "new" do
    get :new  
    assert_template 'admin/director/new'  
    assert_tag 'h1', :content => 'Crear director'  
    assert_tag 'form', :attributes => { :action => '/admin/director/create' }   
  end  

  test "create" do
    get :new    
    assert_template 'admin/director/new'
    assert_difference(Director, :count) do
      post :create, :director => {:first_name => 'Joel', :last_name => 'Spolsky'}
      assert_response :redirect
      assert_redirected_to :action => 'index'      
    end
    assert_equal 'Director Joel Spolsky correctamente creado.', flash[:notice]
  end

  test "edit" do
    get :edit, :id => 1
    assert_tag :tag => 'input', :attributes => { :name => 'director[first_name]', :value => 'Joel' }
    assert_tag :tag => 'input', :attributes => { :name => 'director[last_name]', :value => 'Spolsky' }
  end

  test "update" do
    post :update, :id => 1, :director => { :first_name => 'Joseph', :last_name => 'Spolsky' }
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
    assert_equal 'Joseph', Director.find(1).first_name
  end

  test "test_destroy" do
    assert_difference(Director, :count, -1) do
      post :destroy, :id => 1
      assert_equal flash[:notice], 'Director Joel Spolsky correctamente eliminado.'
      assert_response :redirect
      assert_redirected_to :action => 'index'
      get :index
      assert_response :success
      assert_tag :tag => 'div', :attributes => {:id => 'notice'},
        :content => 'Director Joel Spolsky correctamente eliminado.'
    end
  end

  test "show" do
    get :show, :id => 1
    assert_template 'admin/director/show'
    assert_equal 'Joel', assigns(:director).first_name
    assert_equal 'Spolsky', assigns(:director).last_name
    assert_tag "h1", :content => Director.find(1).name
  end

  test "index" do
    get :index
    assert_response :success
    assert_tag :tag => 'table', :children => { :count => Director.count + 1, :only => {:tag => 'tr'} }
    Director.find_each do |a|
      assert_tag :tag => 'td', :content => a.name
    end
  end
end

