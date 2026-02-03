class HealthController < ApplicationController
  skip_before_action :authenticate_user!
  
  def up
    render plain: "OK", status: :ok
  end
end
