class PlayerBuilder

  def self.build
    build = new
    yield(build)
    build.player
  end
  
  def initialize
    @player = Player.new
  end

  def set_name(name)
    @player.name = name
  end

  def set_number(number)
    @player.number = number
  end

  def player
    @player
  end
end