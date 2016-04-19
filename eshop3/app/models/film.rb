class Film < ActiveRecord::Base
	HUMANIZED_ATTRIBUTES = {
		:cover_image => "Imagen de Portada",
		:cover_image_content_type => "Imagen de Portada",
		:title => "Título",
		:producer => "Productora",
		:directors => "Directores",
		:produced_at => "Producido por",
		:duration => "Duración",
		:price => "Precio",
		:cod => "Código",
	}
	
	def self.human_attribute_name(attr, options = {})
		HUMANIZED_ATTRIBUTES[attr.to_sym] || super
	end
	
	has_and_belongs_to_many :directors
	belongs_to :producer

	#has_many :cart_items
	#has_many :carts, :through => :cart_items

	has_attached_file :cover_image, :styles => { :medium =>"300x300>", :thumb => "270x400>" }
	validates_attachment_content_type :cover_image, :content_type => ["image/jpeg", "image/gif", "image/png"], message:"tiene un formato no válido"

	validates_length_of :title, :in => 1..255, message:"no puede estar vacío"
	validates_presence_of :producer, message:"no puede estar vacío"
	validates_presence_of :directors, message:"no puede estar vacío"
	validates_presence_of :produced_at, message:"no puede estar vacío"
	validates_numericality_of :duration, :only_integer => true, message:"debe ser entero"
	validates_numericality_of :price, message:"debe ser numérico"
	validates_presence_of :cod, message:"no puede estar vacío"
  	validates_length_of :cod, :in => 1..3, message:"debe tener máximo 3 números"
	validates_format_of :cod, :with => /[0-9]{3}/, message:"tiene un formato no válido"
	validates_uniqueness_of :cod, message:"debe ser único"

	def director_names
		self.directors.map{|director| director.name}.join(", ")
	end

	def self.latest(num)
		all.order("films.id desc").includes(:directors, :producer).limit(num)
	end
end
