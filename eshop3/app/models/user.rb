class User < ActiveRecord::Base
  HUMANIZED_ATTRIBUTES = {
    :name => "Nombre",
    :login => "Usuario",
    :email => "E-mail",
    :password => "Contraseña",
    :password_confirmation => "Confirmación de contraseña",
  }
  
  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  acts_as_authentic do |a|
    a.validate_login_field = true
    a.validate_password_field = true
    a.require_password_confirmation = true
    a.logged_in_timeout = 5.minutes # default is 10.minutes
    # for using default encryption system (SCrypt) also install 'scrypt' gem
    a.crypto_provider = Authlogic::CryptoProviders::Sha512
  end

  validates_presence_of :name, message:"no puede estar vacío"
  validates_presence_of :login, message:"no puede estar vacío"
  validates_presence_of :email, message:"no puede estar vacío"
  validates_presence_of :password, message:"no puede estar vacío"
  validates_presence_of :password_confirmation, message:"no puede estar vacío"
  validates_length_of :name, :in => 3..225, message:"no puede estar vacío"
  validates_uniqueness_of :name, :login, :email, message:"debe ser único"

end
