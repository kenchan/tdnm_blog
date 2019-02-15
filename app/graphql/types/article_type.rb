module Types
  class ArticleType < Types::BaseObject
    field :title, String, null: true
    field :body, String, null: true
    field :slug, String, null: true
    field :published_on, Types::DateType, null: true
  end
end
