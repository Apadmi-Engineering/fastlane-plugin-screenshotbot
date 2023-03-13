describe Fastlane::Actions::ScreenshotbotAction do
  describe '#run' do
    it 'executes for a standard run' do
      params = {
        runner_path: "~/screenshotbot/recorder",
        is_pr: false,
        screenshots_directory: "testdir",
        git_branch: "test",
        channel: "testchannel",
        api_key: "apikeytest",
        api_secret: "apisecrettest",
        repo_url: "testrepourl"
      }

      response = double(Process::Status)
      allow(response).to receive(:success?).and_return(true)

      expect(Fastlane::Actions).to receive(:sh)
        .with("/Users/mattm/screenshotbot/recorder --main-branch test --directory testdir --channel testchannel --api-key apikeytest --api-secret apisecrettest --repo-url testrepourl")
      Fastlane::Actions::ScreenshotbotAction.run(params)
    end

    it 'executes for a standard PR' do
      params = {
        runner_path: "~/screenshotbot/recorder",
        is_pr: true,
        screenshots_directory: "testdir",
        pr_destination: "testpr",
        channel: "testchannel",
        api_key: "apikeytest",
        api_secret: "apisecrettest",
        repo_url: "testrepourl"
      }

      response = double(Process::Status)
      allow(response).to receive(:success?).and_return(true)

      expect(Fastlane::Actions).to receive(:sh)
        .with("/Users/mattm/screenshotbot/recorder --main-branch testpr --directory testdir --channel testchannel --api-key apikeytest --api-secret apisecrettest --repo-url testrepourl")
      Fastlane::Actions::ScreenshotbotAction.run(params)
    end
  end
end
