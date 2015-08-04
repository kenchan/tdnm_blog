module ApplicationHelper
  def weblog
    @_weblog ||= Weblog.first
  end
end
