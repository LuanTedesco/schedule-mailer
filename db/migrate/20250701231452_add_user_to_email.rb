class AddUserToEmail < ActiveRecord::Migration[7.0]
  def change
    add_reference :emails, :user, type: :uuid, foreign_key: true
  end
end
