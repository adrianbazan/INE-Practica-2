class ForumPost < ActiveRecord::Base
  validates_length_of :name, :within => 2..50
  validates_length_of :subject, :within => 2..255
  validates_length_of :body, :within => 2..5000
end
