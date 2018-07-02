require 'graphql'
require 'sinatra/base'
require 'sinatra/respond_with'
require 'rack/contrib'

Dir[File.dirname(__FILE__) + '/lib/graphql/types/*.rb'].each do |file| 
  require file 
end

Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each do |file| 
  require file 
end

class GraphqlMock < Sinatra::Base

  use Rack::PostBodyContentTypeParser 
  configure do
    set :bind, "0.0.0.0"
    register Sinatra::RespondWith
  end

  def initialize
    super
  end

  get '/' do
    content_type :json
    result = { 'hello' => 'world'}
    result.to_json
  end

  post '/graphql' do
    result = GraphQLSchema.execute(
      params[:query],
      variables: params[:variables],
      context: { current_user: nil },
    )
    json result
  end

end