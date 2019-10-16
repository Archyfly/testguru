class GitHubClient

  ROOT_ENDPOINT = 'https://gist.github.com'
  ACCESS_TOKEN = ENV['GITHUB_TOKEN']

  #
  # ACCESS_TOKEN = ENV['GITHUB_TOKEN']
  #
  def initialize
    @client = setup_http_client
  end

  #def create_gist(params)
  #  @client.post('gists') do |request|
    #  request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
    #  request.headers['Content-Type'] = 'application/json'

  #  request.body = params.to_json
  #  end
  # end

  private

  def setup_http_client
    @client = Octokit::Client.new(:access_token => ACCESS_TOKEN, :uri => ROOT_ENDPOINT)
    #Faraday.new(url: ROOT_ENDPOINT)
  end


end
