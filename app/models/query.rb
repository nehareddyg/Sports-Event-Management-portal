class Query < ApplicationRecord
  belongs_to :user
  validates_presence_of :question
  # validates_presence_of :answer
end
