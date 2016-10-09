class AddEventToTokens < ActiveRecord::Migration[5.0]
  def change
    add_reference :tokens, :event, foreign_key: true
  end
end
