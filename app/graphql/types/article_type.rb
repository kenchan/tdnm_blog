module Types
  class ArticleType < Types::BaseObject
    field :title, String, null: false
    field :body, String, null: false
    field :slug, String, null: false
    field :published_on, Types::DateType, null: false
  end
end
