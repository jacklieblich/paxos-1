class AddIndexToMessagesDigest < ActiveRecord::Migration[5.0]
  def change
  	add_index :messages, :digest
  end
end
