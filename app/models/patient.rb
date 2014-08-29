class Patient < ActiveRecord::Base
    belongs_to :hospital
    has_many :doctors, as: :doctorable
    has_many :meds
  include Workflow
  workflow do 
    state :waited do
      event :waiting, transition_to: :waited
      event :checkup,  transition_to: :checkedup
      event :xray, transition_to: :xrayed
      event :surgery, transition_to: :surgeryed
      event :pay_bills, transition_to: :paid_bills 
      event :discharge, transition_to: :discharged

    end
    state :checkedup do
      event :waiting, transition_to: :waited
      event :xray, transition_to: :xrayed
      event :surgery, transition_to: :surgeryed
      event :pay_bills, transition_to: :paid_bills 
      event :discharge, transition_to: :discharged

    end

    state :xrayed do
      event :waiting, transition_to: :waited
      event :checkup,  transition_to: :checkedup
      event :surgery, transition_to: :surgeryed
      event :pay_bills, transition_to: :paid_bills 
      event :discharge, transition_to: :discharged
    end

    state :surgeryed do
      event :waiting, transition_to: :waited
      event :checkup,  transition_to: :checkedup
      event :xray, transition_to: :xrayed
      event :pay_bills, transition_to: :paid_bills 
      event :discharge, transition_to: :discharged
    end

    state :paid_bills do
      event :discharge, transition_to: :discharged
    end
    state :discharged
  end
  def DOB_cannot_be_in_the_future
    unless DOB.instance_of?(Date) && (DOB <= Date.today)
      errors.add(:DOB, "must be a DATE before today") 
    end
  end
  validates :DOB, presence: true
  validate :DOB_cannot_be_in_the_future
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :gender, presence: true
  validates :description, presence: true
end
