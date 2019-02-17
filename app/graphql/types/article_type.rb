module Types
  class ArticleType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :body, String, null: false
    field :slug, String, null: false
    field :published_on, String, null: false
  end
end
