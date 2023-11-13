class RecipesController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(current_user.id)
    @recipes = @user.recipes.order(id: :asc)
    # @recipes = @recipes.paginate(page: params[:page], per_page: 5)
  end
end
