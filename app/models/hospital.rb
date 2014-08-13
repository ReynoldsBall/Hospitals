class Hospital < ActiveRecord::Base
  has_many :patients
  has_many :doctors, as: :doctorable
end