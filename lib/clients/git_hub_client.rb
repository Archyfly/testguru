class GitHubClient

  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = 'bee03666f0f5db77fe54f8aaaa8054a0d475203d'

  # пример приведенный выше небезопасен, необходимо
  # указать ACCESS_TOKEN в переменной окружения (скрин 26:57)
  # ACCESS_TOKEN = ENV['GITHUB_TOKEN'] (к примеру)
  #
  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
