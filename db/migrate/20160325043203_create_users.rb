class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      # Add fields that let Rails automatically keep track
      # of when houses are added or modified:
      t.timestamps
    end
  end
end
