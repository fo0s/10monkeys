require 'sinatra'
# Sinatra runner
class AppName < Sinatra::Base
  set :public_folder, 'views'

  get '/' do
    send_file File.join(settings.public_folder, 'pages/landing.html')
  end

  run! if app_file == $PROGRAM_NAME
end
