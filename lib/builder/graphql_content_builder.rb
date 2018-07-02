require 'yaml'

class GraphqlContentBuilder

  def self.build
    build = new
    yield(build)
    build.graphql_content
  end

  def initialize
    @content = {}
    @path = ''
  end

  def set_path(path)
    @path = path
  end

  def build_players(players)
    result = []
    
    players.each do |player|
      result << PlayerBuilder.build do |build|
        build.set_name player['name']
        build.set_number player['number']
      end
    end
    result
  end

  def graphql_content
    @content = YAML.load_file(@path)
    countries = []


    @content['countries'].each do |country|

      players = build_players(country['players'])
      countries << CountryBuilder.build do |build|
        build.set_name country['name']
        build.set_code country['code']
        build.set_players players
      end
      
    end
    countries
  end

  
end