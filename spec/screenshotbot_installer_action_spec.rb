describe Fastlane::Actions::ScreenshotbotInstallerAction do
  describe '#run' do
    it 'Installs Screenshotbot recorder' do
      allow(Open3).to receive(:capture3).with("curl https://screenshotbot.io/recorder.sh | sh")
      Fastlane::Actions::ScreenshotbotInstallerAction.run(nil)
    end
  end
end
