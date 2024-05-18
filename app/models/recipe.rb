class Recipe < ApplicationRecord
  # データを使用して新しいRecipeインスタンスを作成し、保存するメソッド
  def self.new_with_data(data)
    new_recipe = self.new
    new_recipe.title = data[:name] 
    new_recipe.description = data[:instructions]
    new_recipe.image_url = data[:image_url] # 画像のURLを保存する
    new_recipe.save
    new_recipe
  end
end
