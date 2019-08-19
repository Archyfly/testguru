module ApplicationHelper

  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to "Page of this project on Github", "https://github.com/#{author}/#{repo}"
  end
  
end
