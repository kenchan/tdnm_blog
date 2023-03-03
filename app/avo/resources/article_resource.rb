class ArticleResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = ->(params:) do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  field :title, as: :text, format_using: -> (value) { value&.truncate 20 }
  field :body, as: :markdown
  field :slug, as: :text
  field :published_on, as: :date
  field :draft, as: :boolean
  field :featured_image_url, as: :external_image
  # add fields here
end
