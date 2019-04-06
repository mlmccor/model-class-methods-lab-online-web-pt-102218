class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    selection = []
    self.all.select do |boat|
      if selection.count != 5
        selection << boat
      end
    end
    selection
  end

  def self.dinghy
    Boat.all.select {|boat| boat.length < 20}
  end

  def self.ship
    Boat.all.select {|boat| boat.length > 20}
  end

  def self.last_three_alphabetically
    sorted = Boat.all.sort {|a,b| b.name <=> a.name}
    Array.new.push(sorted[0], sorted[1], sorted[2])
  end

  def self.without_a_captain
    Boat.all.select {|boat| !boat.captain}
  end

  def self.sailboats
    sailboat = Classification.find_by(name: 'Sailboat')
    Boat.all.select {|boat| boat.classifications.include?(sailboat)}
  end

  def self.with_three_classifications
    Boat.all.select {|boat| boat.classifications.count == 3}
  end
end
