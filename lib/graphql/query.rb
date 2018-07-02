QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :countries, types[Types::CountryType] do
    description "Get a list of countires"
    resolve ->(_obj, _args, _ctx) {
      GraphqlContentBuilder.build do |build|
        build.set_path 'resources/graphql_content.yml'
      end
    }
  end
end