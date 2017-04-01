class Patient < ApplicationRecord
has_many :requests

#search
def self.search(search_for)
Patient.where("lastname = ?", search_for)
end
end
