class Ifttt::Locations::KitakuController < ApplicationController
  include SlackClient

  def create
    time_now = Time.zone.now.in_time_zone('Asia/Tokyo')

    if can_deliver_message?(time_now)
      message = "#{ Rails.application.secrets.slack[:kitaku_message] }\nI will be arriving at Home around #{ (time_now + 30.minutes).strftime("%H:%M") }."
      slack_push(message: message, username: "Kitaku Bot", icon_emoji: ":train:", channel: "#kitaku")
    end

    render json: { status: :success }
  end

  private

  def can_deliver_message?(time_now)
    # between 17:00 and 23:59
    hour = time_now.hour
    (hour >= 17 && hour <= 23)
  end
end
