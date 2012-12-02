class Application < Sinatra::Base

  before do
    add_js "application"
    add_css "screen"
  end

  # Put Routes Here
  get "/" do
    title "Home Page"
    description "An application framework with Sinatra, MongoID, and Redis"
    #@message = "Hello visitor ##{Counter.increment.to_s} the CRON has been run #{Counter.cron.to_s} times"
    @message = "Hello"
    erb :index
  end

end