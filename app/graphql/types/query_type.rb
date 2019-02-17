module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :article, Types::ArticleType, null: true do
      description 'Find a article by ID'
      argument :id, ID, required: true
    end

    field :articles, [Types::ArticleType], null: false do
      description 'List articles'
    end

    def article(id:)
      Article.find(id)
    end

    def articles
      Article.limit(10)
    end
  end
end
