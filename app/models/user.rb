class User < ActiveRecord::Base
  attr_accessible :name, :id, :email, :credits
  validates :email, :presence=>true
  has_many :messages
  before_save :default_values
  def default_values
    self.credits ||= 0
  end
end
