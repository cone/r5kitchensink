class Product < ApplicationRecord
  # self.table_name = 'PRODUCT'
  # self.primary_key = 'MYID'

  belongs_to :brand
end
