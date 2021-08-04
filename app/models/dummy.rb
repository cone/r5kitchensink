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

  # we can access attributes in the model instance like:
  # d = Dummy.first
  # d['name']
  # d[:name]
  # d.attributes
  # the above one returns a hash with the values like:
  # {"id"=>1, "name"=>"Dummy1", "created_at"=>Sat, 26 Oct 2019 17:15:30 UTC +00:00, "updated_at"=>Sat, 26 Oct 2019 17:15:30 UTC +00:00}

end
