class Recruiter < ApplicationRecord
  belongs_to :person
  belongs_to :organization
end
