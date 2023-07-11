class AddNameKindLevelToCharacter < ActiveRecord::Migration[6.1]
  def change
    add_column :characters, :nickname, :string
    add_column :characters, :kind, :integer
    add_column :characters, :level, :integer
  end
end
