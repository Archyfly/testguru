class GistQuestionService

#require 'octokit'

ROOT_ENDPOINT = 'https://gist.github.com'
ACCESS_TOKEN = ENV['GITHUB_TOKEN']

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => ACCESS_TOKEN, :uri => ROOT_ENDPOINT)
    #@client = client || GitHubClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru by Octokit",
        files: {
          'test-guru-question.txt' => {
          content: gist_content
         }
       }
    }
  end

  def gist_content
    content = [@question.title]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
