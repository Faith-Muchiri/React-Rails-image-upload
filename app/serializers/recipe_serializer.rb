class RecipeSerializer < ActiveModel::Serializer
  
  # include JSONAPI::Serializer
  attributes :id, :title, :description, :instruction,  :image

  # def updated_at
  #   object.updated_at.to_date
  # end
end
