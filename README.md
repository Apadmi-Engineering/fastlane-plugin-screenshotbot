# Fastlane Screenshotbot Plugin

[![fastlane Plugin Badge](https://img.shields.io/gem/v/fastlane-plugin-screenshotbot.svg?style=flat)](https://rubygems.org/gems/fastlane-plugin-screenshotbot)

Fastlane plugin to upload screenshots to Screenshotbot for visual testing.

## Features

- Install the Screenshotbot CLI 
- Upload screenshots to Screenshotbot

## Installation

Add to your `fastlane/Pluginfile`:

```ruby
gem 'fastlane-plugin-screenshotbot'
```

Or install directly:

```bash
fastlane add_plugin screenshotbot
```

## Usage

Add to your `Fastfile`:

```ruby
lane :upload_screenshots do
  screenshotbot(
    screenshots_directory: "./screenshots",
    channel: "production",
    api_key: ENV["SCREENSHOTBOT_API_KEY"],
    api_secret: ENV["SCREENSHOTBOT_API_SECRET"],
    repo_url: "https://github.com/yourusername/your-repo"
  )
end
```

For pull requests:

```ruby
lane :upload_pr_screenshots do
  screenshotbot(
    screenshots_directory: "./screenshots",
    channel: "pr-preview",
    api_key: ENV["SCREENSHOTBOT_API_KEY"],
    api_secret: ENV["SCREENSHOTBOT_API_SECRET"],
    repo_url: "https://github.com/yourusername/your-repo",
    is_pr: true,
    pr_destination: ENV["GITHUB_BASE_REF"] || "main"
  )
end
```

If you need to install the Screenshotbot CLI (as it's not part of your CI image or build setup steps):

```ruby
lane :install_screenshotbot do
  screenshotbot_installer
end
```

## Options

| Option | Description | Required | Default |
|--------|-------------|:--------:|:-------:|
| `screenshots_directory` | Directory with screenshots | ✅ | - |
| `channel` | Screenshotbot channel | ✅ | - |
| `api_key` | Screenshotbot API key | ✅ | - |
| `api_secret` | Screenshotbot API secret | ✅ | - |
| `repo_url` | Git repository URL | ✅ | - |
| `is_pr` | PR build flag | ❌ | `false` |
| `pr_destination` | PR target branch | ❌ | - |
| `api_hostname` | Custom API hostname | ❌ | - |
| `recorder_path` | Path to recorder binary | ❌ | `~/screenshotbot/recorder` |

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
