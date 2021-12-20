class Event < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_many :registrations
    has_many :users, through: :registrations
    has_one_attached :photo
    validates:name, presence:true
    validates:description, presence:true
    validates:start, presence:true
    validates:end, presence:true
    validate :correct_image_type
    # validates:photo, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..(10.megabytes) }
    

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

    private

    def correct_image_type
        if photo.attached? && !photo.content_type.in?(%w(image/jpeg image/png))
            errors.add(:image, 'must be a JPEG, JPG or PNG')
        end
    end
end
