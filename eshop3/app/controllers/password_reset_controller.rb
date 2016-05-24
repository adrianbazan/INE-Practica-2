class PasswordResetController < ApplicationController
	before_filter :require_no_user

	def new
		@page_title = 'Contraseña olvidada'
	end

	def create
		@user=User.find_by email: params[:email]
		if @user
			@user.reset_perishable_token!
			Notifier.password_reset_instructions(@user).deliver
			flash[:notice] = 'Se han enviado las instrucciones para restaurar su contraseña. Por favor revise su correo.'
			redirect_to :controller => 'user_sessions', :action => 'new'
		else
			@page_title = 'Contraseña olvidada'
			flash[:notice] = 'No se ha encontrado ningún usuario con ese email.'
			render :action => 'new'
		end
	end

	def edit
		@page_title='Recuperar contraseña'
		@@url=request.original_url
		@user=User.new()#use this to avoid nil error
	end

	def update
		uri = URI.parse(URI.encode(@@url.strip))
		params = CGI.parse(uri.query)
		id = params['id'].first
		@user=User.find_using_perishable_token(id, 1.hour)
		if @user
			if @user.update_attributes(user_params)
			flash[:notice] = 'Contraseña restablecida'
			redirect_to :controller => '/admin/director', :action => :index # default login route
			else
			render :action => 'edit'
			end
		else
			flash[:notice] = 'Token inválido'
			redirect_to :controller => '/admin/director', :action => :index # default login route
		end
	end

	private
	    def user_params
		 params.require(:user).permit(:password, :password_confirmation)
	    end
end
