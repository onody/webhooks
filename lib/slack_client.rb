require 'slack-notifier'

module SlackClient
  def slack_push(message:, **options)
    webhook_url = Rails.application.secrets.slack[:webhook_url]

    notifier = Slack::Notifier.new webhook_url
    notifier.ping message, options
  end
end
