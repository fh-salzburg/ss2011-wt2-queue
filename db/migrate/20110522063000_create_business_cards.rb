class CreateBusinessCards < ActiveRecord::Migration
  def self.up
    create_table :business_cards do |t|
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.string :name

      t.string :card_file_name
      t.string :card_content_type
      t.integer :card_file_size
      t.datetime :card_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :business_cards
  end
end
