class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]

  def new
    @user_session = UserSession.new
    @page_title = 'Login'
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    @user_session.remember_me = false # just in case
    if @user_session.save
      flash[:notice] = "Sesión iniciada correctamente."
      redirect_to :controller => '/admin/director', :action => :index # default login route
	 #redirect_back_or_dafult redirect to producer
    else
      render :action => :new
    end
  end

  def destroy
    if current_user_session # only for an authenticated user
      current_user_session.destroy
      flash[:notice] = "Sesión cerrada correctamente."
    end  
    redirect_to :controller => :catalog, :action => :index # logout route
  end

  private
    def user_session_params
      params.require(:user_session).permit(:login, :password, :remember_me)
    end
end
