class AddConfirmableToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table(:users) do |t|
      t.string    :confirmation_token
      t.datetime  :confirmed_at
      t.datetime  :confirmation_sent_at
      # t.string    :unconfirmed_email
    end
  add_index :users, :confirmation_token, :unique => true
  end
end

  # def up
  #   add_column :users, :confirmation_token, :string
  #   add_column :users, :confirmed_at, :datetime
  #   add_column :users, :confirmation_sent_at, :datetime

  #   add_index :users, :confirmation_token, unique: true

  #   execute("UPDATE users SET confirmed_at = NOW()")
  # end
  # def down
  #   remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent_at
  # end
