require 'random_name_generator'

require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/namespace'
require 'sinatra/routes'
require 'sinatra/cross_origin'
require 'require_all'
require 'sequel'
require 'multi_json'
require './config/database'
require './config/create_table'
require_all 'models'

# api server
class App < Sinatra::Base
  register Sinatra::CrossOrigin
  register Sinatra::Namespace
  register Sinatra::Routes

  configure do
    enable :cross_origin
    set :allow_origin, '*' # allows any origin(domain) to send fetch requests to your API
    set :allow_methods, %i[get post patch delete options] # allows these HTTP verbs
    set :allow_credentials, true
    set :max_age, 1_728_000
    set :expose_headers, ['Content-Type']
  end

  options '*' do
    response.headers['Allow'] = 'HEAD,GET,POST,DELETE,OPTIONS'
    response.headers['Access-Control-Allow-Headers'] =
      'X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept'
    200
  end

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    File.read(File.join('public', 'index.html'))
  end

  not_found do
    File.read(File.join('public', 'index.html'))
  end
end

def json_params
  JSON.parse(request.body.read)
rescue StandardError
  halt 400, { result: 'Invalid JSON' }.to_json
end

require_all 'routes'

# 10000.times do
#   user = User.new
#   rng = RandomNameGenerator.new(RandomNameGenerator::ROMAN)
#   name =  rng.compose(3)
#   user.name = name
#   user.email = "#{name}@example.com"
#   user.save
# end
