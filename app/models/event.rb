class Event < ApplicationRecord
  has_many :eventschedules
  has_many :teams
  validates_presence_of :name
  validates_presence_of :duration, numericality: true
  validates_presence_of :teamsize, numericality: true, greater_than_or_equal_to: 1 
  validates_presence_of :maxnumberofteams, numericality: true, greater_than_or_equal_to: 1 
end
