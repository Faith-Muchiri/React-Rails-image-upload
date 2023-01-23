class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :instruction, :updated_at

  def updated_at
    object.updated_at.to_date
  end
end
