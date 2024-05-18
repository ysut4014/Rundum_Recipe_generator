class RecipesController < ApplicationController
  def index
    response = HTTParty.get('https://www.themealdb.com/api/json/v1/1/random.php')
    data = JSON.parse(response.body)
    recipe_data = data['meals'][0]

    # Recipeモデルの新しいインスタンスを作成し、データをセットする
    @recipe = Recipe.new_with_data(
      name: recipe_data['strMeal'],
      instructions: recipe_data['strInstructions'],
      image_url: recipe_data['strMealThumb'] # 画像のURLを取得
    )

    if @recipe.save
      flash[:success] = "Recipe created successfully!"
    else
      flash[:error] = "Failed to create recipe"
    end
  end
  
  def new
    @recipe = Recipe.new
  end
end
