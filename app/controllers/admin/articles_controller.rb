module Admin
  class ArticlesController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    #def index
    #  super
    #  @resources = Article.all.paginate(10, params[:page])
    #end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Article.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information

    # Override Admin::ApplicationController#order
    def order
      @order ||= Administrate::Order.new(
        params.fetch(resource_name, {}).fetch(:order, 'published_on'),
        params.fetch(resource_name, {}).fetch(:direction, 'desc'),
      )
    end
  end
end
