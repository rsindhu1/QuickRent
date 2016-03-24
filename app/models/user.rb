class User < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :sex
      t.timestamps
    end
  end
end