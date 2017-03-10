class HomeController < ApplicationController
  layout "main_layout"
  skip_before_action :authenticate_user!, :only => [:index]

  def index
  end

  def hello
  end
end
