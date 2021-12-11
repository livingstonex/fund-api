class Event < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_one_attached :image
    validates:name, presence:true
    has_many :registrations
    has_many :users, through: :registrations

    def to_frontend
        {
            name: self.name,
            description: self.description,
            start: self.start,
            end: self.end,
            image: self.image.attached? ? rails_blob_path(self.image, only_path: true) : nil,
            attendees: self.users
            # rails_blob_path(self.image, only_path: true) if self.image.attached?
            # Rails.application.routes.url_helpers.url_for(self.image),
        }
    end
end
