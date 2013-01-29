class Question < ActiveRecord::Base
  attr_accessible :prompt, :type, :slug, :status, :possible_responses_attributes
  belongs_to :survey
  has_many :possible_responses
  accepts_nested_attributes_for :possible_responses, allow_destroy: true

  validates_presences_of :survey, :prompt, :type, :slug, :status
  validates_inclusion_of :status, in: Survey::STATUSES

end
