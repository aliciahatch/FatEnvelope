class Bootcamp < ActiveRecord::Base
  attr_accessible :bootcamp_date
  
  def date_formatted
    self.bootcamp_date.strftime("%m/%d/%Y")
  end
  
end
