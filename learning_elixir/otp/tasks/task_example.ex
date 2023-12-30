defmodule TaskExample do
  def db_update do
    "DB update result"
  end

  def send_email do
    {:ok, "Email has been sent"}
  end

  def notify_remote_api do
    {:ok, "Notification has been sent"}
  end
end
