class Comedian < ActiveRecord::Base
  has_many :specials

  validates :age, presence: true
  validates :name, presence: true

  def self.average_age
    average(:age).round
  end

  def self.unique_hometowns
    distinct.pluck(:hometown)
  end

  def self.sorter(parameters)
    if parameters[:age]
      where(age: parameters[:age])
    else
      all
    end
  end
end
