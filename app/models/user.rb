class User < ActiveRecord::Base
  attr_accessible :name, :id, :email
end
