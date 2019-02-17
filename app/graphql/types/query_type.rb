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
      argument :published_on, String, required: false
    end

    def article(id:)
      Article.find(id)
    end

    def articles(published_on: nil)
      if published_on
        Article.where(published_on: published_on)
      else
        Article.limit(10)
      end
    end
  end
end
