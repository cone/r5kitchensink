class Dummy < ApplicationRecord
  # defining a default value using rails 5 attribute API
  attribute :name, :string, default: 'n/a'

  has_many :tests

  # how we would do it in older versions of rails
  # def name
  #   read_attribute(:name) || 'n/a'
  #   # or: self[:name] || 'n/a'
  # end

  # how to add some extra text in all names
  # def name=(value)
  #   write_attribute(:name, value + ' is the name')
  #   # or self[:name] = value + ' is the name'
  # end
end
