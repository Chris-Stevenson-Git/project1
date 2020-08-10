class ApplicationController < ActionController::Base

  before_action :fetch_user

  def fetch_user
    #check to ensure that the user is logged in
    if session[:user_id].present?
      #.find_by instead of .find so if it's not present it won't be an error.
      @current_user = User.find_by id: session[:user_id]
    end
    #force logout if user ID isn't found.
    unless session[:user_id].present?
      session[:user_id] = nil
    end
  end#fetch_user


  #Function to work out how long since a database entry was created
  def since_time(create_time)
    time_dif = Time.now.to_i - create_time.to_i
    time_key = {
      'Y' => 31536000,
      'M' => 2628000,
      'D' => 86400,
      'H' => 3600,
      'm' => 60
    }
    output = time_key.map do |op, num|
      amount, time_dif = time_dif.divmod(num)
      amount
    end

    #silly function for grammar
    def plural(input)
      input>1 ? 's' : ''
    end

    if output[0] > 0
      return "#{output[0]} year#{plural(output[0])} ago"
    elsif output[1] > 0
      return "#{output[1]} month#{plural(output[1])} ago"
    elsif output[2] > 0
      return "#{output[2]} day#{plural(output[2])} ago"
    elsif output[3] > 0
      return "#{output[3]} hour#{plural(output[3])} ago"
    elsif output[4] > 0

      return "#{output[4]} minute#{plural(output[4])} ago"
    else
      return "Just now"
    end
  end#since_time

end#ApplicationController
