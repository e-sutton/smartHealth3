class Patient < ApplicationRecord
has_many :requests
has_many :prescriptions

#search
def self.search(search_for)
Patient.where("lastname = ?", search_for)
end
end
