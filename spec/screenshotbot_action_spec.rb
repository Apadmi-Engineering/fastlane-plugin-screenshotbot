describe Fastlane::Actions::ScreenshotbotAction do
  describe '#run' do
    it 'executes for a standard run' do
      params = {
        recorder_path: "/path/to/runner",
        is_pr: false,
        screenshots_directory: "testdir",
        git_branch: "test",
        channel: "testchannel",
        api_key: "apikeytest",
        api_secret: "apisecrettest",
        repo_url: "testrepourl"
      }

      response = instance_double(Process::Status)
      allow(response).to receive(:success?).and_return(true)

      expect(Fastlane::Actions).to receive(:sh)
        .with("/path/to/runner --main-branch test --directory testdir --channel testchannel --api-key apikeytest --api-secret apisecrettest --repo-url testrepourl")
      Fastlane::Actions::ScreenshotbotAction.run(params)
    end

    it 'executes for a PR' do
      params = {
        recorder_path: "/path/to/runner",
        is_pr: true,
        screenshots_directory: "testdir",
        pr_destination: "testpr",
        channel: "testchannel",
        api_key: "apikeytest",
        api_secret: "apisecrettest",
        repo_url: "testrepourl"
      }

      response = instance_double(Process::Status)
      allow(response).to receive(:success?).and_return(true)

      expect(Fastlane::Actions).to receive(:sh)
        .with("/path/to/runner --main-branch testpr --directory testdir --channel testchannel --api-key apikeytest --api-secret apisecrettest --repo-url testrepourl")
      Fastlane::Actions::ScreenshotbotAction.run(params)
    end

    it 'executes with extra parameters' do
      params = {
        recorder_path: "/path/to/runner",
        is_pr: false,
        screenshots_directory: "testdir",
        git_branch: "test",
        channel: "testchannel",
        api_key: "apikeytest",
        api_secret: "apisecrettest",
        repo_url: "testrepourl",
        runner_args: "--extra-params --more-extra-params"
      }

      response = instance_double(Process::Status)
      allow(response).to receive(:success?).and_return(true)

      expect(Fastlane::Actions).to receive(:sh)
        .with("/path/to/runner --main-branch test --directory testdir --channel testchannel --api-key apikeytest --api-secret apisecrettest --repo-url testrepourl --extra-params --more-extra-params")
      Fastlane::Actions::ScreenshotbotAction.run(params)
    end

    it 'executes with hostname' do
      params = {
        recorder_path: "/path/to/runner",
        is_pr: false,
        api_hostname: "https://test.com"
      }

      response = instance_double(Process::Status)
      allow(response).to receive(:success?).and_return(true)

      expect(Fastlane::Actions).to receive(:sh)
        .with("/path/to/runner --api-hostname https://test.com")
      Fastlane::Actions::ScreenshotbotAction.run(params)
    end
  end
end
