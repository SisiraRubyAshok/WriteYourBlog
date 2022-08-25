class AddPosttoblog < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs , :post, :integer, default: 0
  end
end
