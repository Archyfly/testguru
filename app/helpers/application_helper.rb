module ApplicationHelper

  def current_year
    Time.now.year
  end

  def github_url
    link_to "Page of this project on Github", "https://github.com/Archyfly/testguru"
  end
end
