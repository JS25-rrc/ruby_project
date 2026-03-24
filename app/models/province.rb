class Province < ApplicationRecord
    validates :name, presence: true
    validates :abbreviation, presence: true
    validates :gst_rate, numericality: { greater_than_or_equal_to: 0 }
    validates :pst_rate, numericality: { greater_than_or_equal_to: 0 }
    validates :hst_rate, numericality: { greater_than_or_equal_to: 0 }

    def self.ransackable_attributes(auth_object = nil)
        ["id", "name", "abbreviation", "gst_rate", "pst_rate", "hst_rate"]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end

end