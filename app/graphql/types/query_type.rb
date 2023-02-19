module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :article, Types::ArticleType, null: true do
      description 'Find a article'
      argument :id, ID, required: false
      argument :slug, String, required: false
    end

    field :articles, Types::ArticleType.connection_type, null: false, max_page_size: 100 do
      description 'List articles'
      argument :published_on, String, required: false
    end

    def article(id: nil, slug: nil)
      if id
        Article.find(id)
      else
        Article.where(title: slug).first
      end
    end

    def articles(published_on: nil)
      if published_on
        Article.where(published_on: published_on)
      else
        Article.order(published_on: :desc)
      end
    end
  end
end
