class CreateTwitts < ActiveRecord::Migration[6.1]
  def change
    create_table :twitts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :twitter_account, null: false, foreign_key: true
      t.text :body
      t.datetime :publish_at
      t.string :twitt_id

      t.timestamps
    end
  end
end
