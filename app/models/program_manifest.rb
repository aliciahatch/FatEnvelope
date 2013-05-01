class ProgramManifest < ActiveRecord::Base
  belongs_to :step
  belongs_to :program
end
