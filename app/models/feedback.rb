class Feedback < ApplicationRecord
	validates_presence_of :eventname
	validates_presence_of :feedback
end
