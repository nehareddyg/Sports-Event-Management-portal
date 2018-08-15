class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if record.starttime.strftime( "%H%M" ) >= record.endtime.strftime( "%H%M" )
      record.errors[:base] << "Start Time should be smaller than End Time"
    end
  end
end

class Eventschedule < ApplicationRecord
  belongs_to :event
  has_many :eventslots
  # validates_presence_of :name
  validates_presence_of :date
  validates_presence_of :starttime
  validates_presence_of :endtime
  validates_with GoodnessValidator
end
