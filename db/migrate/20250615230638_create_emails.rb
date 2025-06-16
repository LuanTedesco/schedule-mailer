class CreateEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :emails, id: :uuid do |t|
      t.string :to
      t.string :mail
      t.string :body
      t.datetime :scheduled_at, default: -> { "CURRENT_TIMESTAMP" }
      t.boolean :sended, default: false
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
