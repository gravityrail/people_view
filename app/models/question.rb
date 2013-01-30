class Question < ActiveRecord::Base
  KINDS = [['Yes Or No', 'yes_no'], ['Free Form', 'text'], ['Multiple Choice', 'multiple']]

  attr_accessible :prompt, :kind, :slug, :status, :possible_responses_attributes
  belongs_to :survey
  has_many :possible_responses
  accepts_nested_attributes_for :possible_responses, allow_destroy: true

  validates_presence_of :prompt, :kind, :slug, :status
  validates_inclusion_of :status, in: Survey::STATUSES
  validates_inclusion_of :kind, in: KINDS.map(&:last)

end
