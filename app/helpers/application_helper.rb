module ApplicationHelper
  def csrf_html
    <<-HTML.html_safe
      <input type="hidden"
      name="authenticity_token"
      value="#{form_authenticity_token}">
    HTML
  end
end
