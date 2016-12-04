class WelcomeController < ApplicationController
    layout 'application', :except => [:home]
  def home
  end

  def help
  end
end
