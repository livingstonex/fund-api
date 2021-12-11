class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event


  def to_frontend
    {
        user_id: self.user_id,
        event_id: self.event_id,
        user: self.user,
        event: self.event
    }
  end
end
