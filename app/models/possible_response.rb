class PossibleResponse < ActiveRecord::Base
  attr_accessible :name, :feedback
  belongs_to :question

  validates_presence_of :question, :name
end
