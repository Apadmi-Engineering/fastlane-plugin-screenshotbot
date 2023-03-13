describe Fastlane::Helper::ScreenshotbotHelper do
  describe 'Repo extraction' do
    it 'Converts a repo URL into a web URL' do
      input = "git@bitbucket.org:myworkspace/my-repo.git"
      expected = "https://bitbucket.org/myworkspace/my-repo"

      result = Fastlane::Helper::ScreenshotbotHelper.convert_repo_to_web_url(input)
      expect(result).to eq(expected)
    end

    it 'Converts a web URL and PR id into a PR url' do
      input_url = "https://bitbucket.org/myworkspace/my-repo"
      input_pr = "17"

      expected = "https://bitbucket.org/myworkspace/my-repo/pull-requests/17"

      result = Fastlane::Helper::ScreenshotbotHelper.create_pr_url(input_url, input_pr)

      expect(result).to eq(expected)
    end
  end
end
