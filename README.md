# Graphql-example Ruby
A brief example to use grapqhql with ruby


## Installation and run
Local(with ruby)
```
bundle install
rackup
```

Docker mode
```
docker build -t graphql:example .
docker run -ti --rm -p 9292:9292 graphql:example
```
## Usage
Perform a post to your host `http://localhost:9292/graphql`
if you are using docker, please check your address for docker net
```
{
   "query" : "{ countries {  name code   players { number  name }  } }"
}
```

The application will return the information, you can add/remove fields like name,code to receive clean responses

```
{
    "data": {
        "countries": [
            {
                "name": "Argentina",
                "code": "ARG",
                "players": [
                    {
                        "number": "10",
                        "name": "Messi"
                    },
                    {
                        "number": "11",
                        "name": "Di Maria"
                    },
                    ....
                ]
            },
            {
                "name": "Brazil",
                "code": "BRA",
                "players": [
                    {
                        "number": "10",
                        "name": "Neymar Jr"
                    },
                    {
                        "number": "9",
                        "name": "G Jesús"
                    },
                    ...
                ]
            }
        ]
    }
}