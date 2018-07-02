module Types
  PlayerType = GraphQL::ObjectType.define do
    name 'Player'
    description 'Player from a Country'
    field :name, types.String
    field :number, types.String
  end
end