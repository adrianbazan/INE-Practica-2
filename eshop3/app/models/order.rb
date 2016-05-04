class Order < ActiveRecord::Base

	HUMANIZED_ATTRIBUTES = {
		:phone_number => "Teléfono",
		:ship_to_first_name => "Nombre",
		:ship_to_last_name => "Apellidos",
		:ship_to_address => "Dirección",
		:ship_to_city => "Ciudad",
		:ship_to_postal_code => "Código postal",
		:card_number => "Número de tarjeta",
		:card_verification_value => "CVV/CVC"
	}

  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  attr_accessor :card_type, :card_number, :card_expiration_month, :card_expiration_year,             
                :card_verification_value

  has_many :order_items
  has_many :films, :through => :order_items

  validates_presence_of :order_items,
                        :message => '¡Tu carrito esta vacío! ' +
                       		    'Por favor añade una película a tu carrito antes de proceder con el pago.'
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => 'inválido.'
  validates_length_of :phone_number, :in => 7..20, :message => 'debe ser de 7 a 20 caracteres.'

  validates_length_of :ship_to_first_name, :in => 2..255, :message => 'debe ser de 2 a 255 caracteres.'
  validates_length_of :ship_to_last_name, :in => 2..255, :message => 'debe ser de 2 a 255 caracteres.'
  validates_length_of :ship_to_address, :in => 2..255, :message => 'debe ser de 2 a 255 caracteres.'
  validates_length_of :ship_to_city, :in => 2..255, :message => 'debe ser de 2 a 255 caracteres.'
  validates_length_of :ship_to_postal_code, :in => 2..255, :message => 'debe ser de 2 a 255 caracteres.'
  validates_length_of :ship_to_country_code, :in => 2..255, :message => 'debe ser de 2 a 255 caracteres.'

  validates_length_of :customer_ip, :in => 7..15, :message => 'debe ser de 7 a 15 caracteres.'
  validates_inclusion_of :status, :in => %w(abierto procesado cerrado fallido), :message => 'no permitido.'

  validates_inclusion_of :card_type, :in => ['Visa', 'MasterCard', 'American Express', 'Discover'], :on => :create, :message => 'no permitida.'
  validates_length_of :card_number, :in => 13..19, :on => :create, :message => 'debe ser de 13 a 19 caracteres.'
  validates_inclusion_of :card_expiration_month, :in => %w(1 2 3 4 5 6 7 8 9 10 11 12), :on => :create, :message => 'no permitido.'
  validates_inclusion_of :card_expiration_year, :in => %w(2013 2014 2015 2016 2017 2018), :on => :create, :message => 'no permitido.'
  validates_length_of :card_verification_value, :in => 3..4, :on => :create, :message => 'debe ser de 3 a 4 caracteres.'

  def total
    sum = 0
    order_items.each do |item|
      sum += item.price * item.amount
    end
    sum
  end

  def process
    begin
      raise 'Un pedido cerrado no puede ser procesado de nuevo' if self.closed?
      active_merchant_payment
    rescue => e
      logger.error("Pedido #{id} ha fallado debido a una excepción: #{e}.")
      self.error_message = "Excepción: #{e}"
      self.status = 'fallido'
    end
    save!
    self.processed?
  end

  def active_merchant_payment
    ActiveMerchant::Billing::Base.mode = :test
    ActiveMerchant::Billing::AuthorizeNetGateway.default_currency = 'EUR'
    ActiveMerchant::Billing::AuthorizeNetGateway.wiredump_device = STDERR   
    ActiveMerchant::Billing::AuthorizeNetGateway.wiredump_device.sync = true
    self.status = 'fallido' # order status by default

    # the card verification value is also known as CVV2, CVC2, or CID
    creditcard = ActiveMerchant::Billing::CreditCard.new(
      :brand              => card_type,
      :number             => card_number,
      :month              => card_expiration_month,
      :year               => card_expiration_year,
      :verification_value => card_verification_value,
      :first_name         => ship_to_first_name,
      :last_name          => ship_to_last_name
    )

    # buyer information
    shipping_address = {
      :first_name => ship_to_first_name,
      :last_name  => ship_to_last_name,
      :address1   => ship_to_address,
      :city       => ship_to_city,
      :zip        => ship_to_postal_code,
      :country    => ship_to_country_code,
      :phone      => phone_number,
    }

    # order information
    details = {
      :description      => 'Compra en Crazy Films',
      :order_id         => self.id,
      :email            => email,
      :ip               => customer_ip,
      :billing_address  => shipping_address,
      :shipping_address => shipping_address
    }

    if creditcard.valid? # validating the card automatically detects the card type
      gateway = ActiveMerchant::Billing::AuthorizeNetGateway.new( # use the test account
        :login     => '9Nxc6P67srD',
        :password  => '397aV96W8aRey432'
        # the statement ":test = 'true'" tells the gateway to not to process transactions
      )

     
      response = gateway.purchase(self.total, creditcard, details)

      if response.success?
        self.status = 'procesado'
      else
        self.error_message = response.message
      end
    else
      self.error_message = 'Tarjeta de crédito no válida'
    end
  end

  def processed?
    self.status == 'procesado'
  end

  def failed?
    self.status == 'fallido'
  end

  def closed?
    self.status == 'cerrado'
  end

  def close
    self.status = 'cerrado'
    save!
  end
end
