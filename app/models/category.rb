class Category < ApplicationRecord
    validates :name, presence: true
    validates :slug, presence: true, uniqueness: true

    def self.ransackable_attributes(auth_object = nil)
        ["id", "name", "description", "slug", "created_at", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end
end