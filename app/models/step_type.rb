class StepType < ActiveRecord::Base
  attr_accessible :name
  belongs_to :step
end
