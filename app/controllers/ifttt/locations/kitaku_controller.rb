class Ifttt::Locations::KitakuController < ApplicationController
  include SlackClient

  def create
    if can_deliver_message?
      message = "#{ Rails.application.secrets.slack[:kitaku_message] }\nI will be arriving at Home around #{ (Time.now + 30.minutes).strftime("%H:%M") }."
      slack_push(message: message, username: "Kitaku Bot", icon_emoji: ":train:")
    end
    render json: { status: :success }
  end

  private

  def can_deliver_message?
    # between 17:00 and 23:59
    hour = Time.now.hour
    (hour >= 17 && hour <= 23)
  end
end
