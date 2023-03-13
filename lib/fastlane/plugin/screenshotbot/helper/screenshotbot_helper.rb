module Fastlane
  module Helper
    class ScreenshotbotHelper
      # class methods that you define here become available in your action
      # as `Helper::ScreenshotbotHelper.your_method`

      # Creates a web URL from the Git repo URL
      # @param [String] input
      def self.convert_repo_to_web_url(input)
        matches = input.match(%r{git@bitbucket.org:(?<workspace>[a-z0-9\-]+)/(?<repo>[a-z0-9\-]+).git})
        workspace = matches[:workspace]
        repo = matches[:repo]

        "https://bitbucket.org/#{workspace}/#{repo}"
      end

      # Makes a pull-request URL from the repo's web URL and the PR ID
      # @param [String] web_url
      # @param [String] pr_id
      def self.create_pr_url(web_url, pr_id)
        "#{web_url}/pull-requests/#{pr_id}"
      end
    end
  end
end
