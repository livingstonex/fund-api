class Event < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_many :registrations
    has_many :users, through: :registrations
    has_one_attached :photo
    validates:name, presence:true
    # validates:description, presence:true
    # validates:start, presence:true
    # validates:end, presence:true
    # validates:image, presence:true
    

    def to_frontend
        {
            name: self.name,
            description: self.description,
            start: self.start,
            end: self.end,
            photo: self.photo.attached? ? polymorphic_url(self.photo, only_path: true) : nil,
            attendees: self.users,
        }
    end
end
