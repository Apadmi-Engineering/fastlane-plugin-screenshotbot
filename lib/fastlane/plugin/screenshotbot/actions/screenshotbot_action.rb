require 'fastlane/action'
require_relative '../helper/screenshotbot_helper'

module Fastlane
  module Actions
    class ScreenshotbotAction < Action
      def self.run(params)
        cli_mapping = {
          main_branch: "main-branch",
          directory: "directory",
          channel: "channel",
          api_key: "api-key",
          api_secret: "api-secret",
          repo_url: "repo-url"
        }

        command_params = {}

        raise "Must supply pr destination if PR==true" if params[:is_pr] && params[:pr_destination].empty?

        command_params[:main_branch] = params[:is_pr] ? params[:pr_destination] : params[:git_branch]

        command_params[:directory] = params[:screenshots_directory]
        command_params[:channel] = params[:channel]
        command_params[:api_key] = params[:api_key]
        command_params[:api_secret] = params[:api_secret]
        command_params[:repo_url] = params[:repo_url]

        command_params = command_params.compact
        command_params = command_params.map do |k, v|
          "--#{cli_mapping[k]} #{v}"
        end

        command = "#{File.expand_path(params[:runner_path])} #{command_params.join(' ')}"
        Actions.sh(command)
      rescue StandardError => e
        UI.crash!("Error running Screenshotbot: #{e.message}")
      end

      def self.description
        "Installs (if needed) and uploads screenshots to screenshotbot"
      end

      def self.authors
        %w[samdc@apadmi.com mattm@apadmi.com]
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :runner_path,
                                       description: "The path to the Screenshotbot runner executable",
                                       env_name: "SCREENSHOTBOT_RUNNER_PATH",
                                       type: String,
                                       default_value: "~/screenshotbot/recorder",
                                       optional: true),
          FastlaneCore::ConfigItem.new(key: :screenshots_directory,
                                       description: "The local directory containing screenshots for upload",
                                       env_name: "SCREENSHOTBOT_SCREENSHOTS_DIRECTORY",
                                       type: String,
                                       optional: false),
          FastlaneCore::ConfigItem.new(key: :channel,
                                       description: "Screenshotbot channel",
                                       env_name: "SCREENSHOTBOT_CHANNEL",
                                       type: String,
                                       optional: false),
          FastlaneCore::ConfigItem.new(key: :api_key,
                                       description: "Screenshotbot api key",
                                       env_name: "SCREENSHOTBOT_API_KEY",
                                       type: String,
                                       optional: false),
          FastlaneCore::ConfigItem.new(key: :api_secret,
                                       description: "Screenshotbot api secret",
                                       env_name: "SCREENSHOTBOT_API_SECRET",
                                       type: String,
                                       optional: false),
          FastlaneCore::ConfigItem.new(key: :repo_url,
                                       description: "URL of the repository",
                                       env_name: "SCREENSHOTBOT_REPO_URL",
                                       type: String,
                                       optional: false),
          FastlaneCore::ConfigItem.new(key: :is_pr,
                                       description: "Whether this is a PR run or not",
                                       env_name: "SCREENSHOTBOT_IS_PR",
                                       type: Boolean,
                                       default_value: false),
          FastlaneCore::ConfigItem.new(key: :pr_destination,
                                       description: "Pull request destination branch",
                                       env_name: "SCREENSHOTBOT_PR_DESTINATION_BRANCH",
                                       type: String,
                                       optional: true),
          FastlaneCore::ConfigItem.new(key: :git_branch,
                                       description: "The current git branch",
                                       env_name: "SCREENSHOTBOT_CURRENT_BRANCH",
                                       type: String,
                                       optional: false)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
