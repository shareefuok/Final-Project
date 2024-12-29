class MainController < ApplicationController
  def index
    @app_name = "Post Management Application"
  end

  def about
    @developer_name = "Shareef Younis"
  end
end
