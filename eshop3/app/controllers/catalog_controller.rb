class CatalogController < ApplicationController
  # ESTO SE QUEDA COMENTADO POR AHORA SEGÚN JOSE MARÍA
  # before_filter :initialize_cart, :except => :show
  # before_filter :require_no_user

  def show
    @film = Film.find(params[:id])
    @page_title = @film.title
  end

  def index
    @films = Film.order("films.id desc").includes(:directors, :producer).paginate(:page => params[:page], :per_page => 5)
    @page_title = 'Catálogo'
  end

  def latest
    @films = Film.latest 5 # invoques "latest" method to get the five latest films
    @page_title = 'Últimas películas'
  end
end