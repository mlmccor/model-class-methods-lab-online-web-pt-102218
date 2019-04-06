class Captain < ActiveRecord::Base
  has_many :boats



  def self.catamaran_operators
    captains = []
    catamaran = Classification.find_by(name: 'Catamaran')
    catamaran.boats.each do |boat|
      if !captains.include?(boat.captain)
        captains << boat.captain
      end
    end
    captains
  end

  def self.sailors
    captains = []
    sailboat = Classification.find_by(name: 'Sailboat')
    sailboat.boats.each do |boat|
      if !captains.include?(boat.captain) && boat.captain
        captains << boat.captain
      end
    end
    captains
  end
  
  def self.sailors
    captains = []
    sailboat = Classification.find_by(name: 'Sailboat')
    sailboat.boats.each do |boat|
      if !captains.include?(boat.captain) && boat.captain
        captains << boat.captain
      end
    end
    captains
  end

  def self.talented_seafarers
    Boat.all.each do |boat|
      if boat.classifications.include?
    binding.pry
  end

end
