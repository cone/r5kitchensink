class AddDummyToTest < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :dummy, foreign_key: true
  end
end
