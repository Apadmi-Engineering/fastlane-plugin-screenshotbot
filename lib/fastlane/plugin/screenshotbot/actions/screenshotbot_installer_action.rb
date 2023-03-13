require 'fastlane/action'
require_relative '../helper/screenshotbot_helper'

module Fastlane
  module Actions
    class ScreenshotbotInstallerAction < Action
      def self.run(params)
        command = "curl https://screenshotbot.io/recorder.sh | sh"
        Actions.sh(command)
      rescue StandardError => e
        UI.crash!("Error running Screenshotbot Installer: #{e.message}")
      end

      def self.description
        "Installs the screenshotbot runner"
      end

      def self.authors
        ["mattm@apadmi.com"]
      end

      def self.available_options
        []
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
