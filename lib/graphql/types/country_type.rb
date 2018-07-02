module Types
  CountryType = GraphQL::ObjectType.define do
    name 'Country'
    description 'Country'

    field :name, types.String
    field :code, types.String
    field :players, types[Types::PlayerType]
  end
end