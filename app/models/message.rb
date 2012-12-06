class Message < ActiveRecord::Base
  validate :is_valid_compliment, :on=>:create
  attr_accessible :body, :user_id
  belongs_to :user
  
  def is_valid_compliment
    if(body.empty?)
      errors.add(:body, "Body cannot be empty")
      false
    else
      if(user_id==nil)
        errors.add(:user_id, "Message must have a recipient")  
        false
      end
      if(JSON.parse(Sentimentalizer.analyze(body))['sentiment']==':(')
        errors.add(:body, "Your message is not a compliment. Try being nice :)")
        false
      end
    end
  end
end
