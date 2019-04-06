class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications
  
  def self.my_all
    Classification.all
  end
  
  def self.longest()
    binding.pry
    Boat.all.sort_by(:length)[0].classifications
  end
  
end
