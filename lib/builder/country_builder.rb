class CountryBuilder
  def self.build
    build = new
    yield(build)
    build.country
  end

  def initialize
    @country = Country.new
  end

  def country
    @country
  end

  def set_name(name)
    @country.name = name
  end

  def set_code(code)
    @country.code = code
  end

  def set_players(players)
    @country.players = players
  end
end