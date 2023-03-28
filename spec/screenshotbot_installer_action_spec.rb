describe Fastlane::Actions::ScreenshotbotInstallerAction do
  describe '#run' do
    it 'Installs Screenshotbot recorder' do
      expect(Fastlane::Actions).to receive(:sh)
        .with("curl https://screenshotbot.io/recorder.sh | sh")
      Fastlane::Actions::ScreenshotbotInstallerAction.run(nil)
    end
  end
end
