class Survey < ActiveRecord::Base
  STATUSES = [ 'drafted', 'published' ]
  attr_accessible :name, :slug, :site_slug, :status, :questions_attributes
  has_many :questions
  accepts_nested_attributes_for :questions, allow_destroy: true

  validates_presence_of :name, :slug, :site_slug, :status
  validates_inclusion_of :status, in: STATUSES

end
