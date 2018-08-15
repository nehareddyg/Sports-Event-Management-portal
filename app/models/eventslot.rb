class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if record.starttime.strftime( "%H%M" ) >= record.endtime.strftime( "%H%M" )
      record.errors[:base] << "Start Time should be smaller than End Time"
    end
    if record.team1name == record.team2name
      record.errors[:base] << "Team Names should be different"
    end
  end
end

class Eventslot < ApplicationRecord
  belongs_to :eventschedule
  validates_presence_of :team1name
  validates_presence_of :team2name
  validates_presence_of :starttime
  validates_presence_of :endtime
  validates_presence_of :venue
	validates_with GoodnessValidator
end
