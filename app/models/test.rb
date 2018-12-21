class Test < ApplicationRecord
  belongs_to :dummy

  # Makes link_to test_path(test) to create '/test/test1'
  # instead of the id, the name is appended to the url
  #def to_param
    #name.parameterize
  #end
end
