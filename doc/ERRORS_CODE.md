## Errors Code
Uiza uses conventional HTTP response codes to indicate the success or failure of an API request.
In general: Codes in the `2xx` range indicate success.
Codes in the `4xx` range indicate an error that failed given the information provided (e.g., a required parameter was omitted, a charge failed, etc.).
Codes in the `5xx` range indicate an error with Uiza's servers.

See details [here](https://docs.uiza.io/#errors-code).

## HTTP status code summary
| Error Code                  | Detail                                                                    |
| ---------------------------:|:--------------------------------------------------------------------------|
| 200 - OK                    | Everything worked as expected.                                            |
| 400 - Bad Request           | The request was unacceptable, often due to missing a required parameter.  |
| 401 - Unauthorized          | No valid API key provided.                                                |
| 404 - Not Found             | The requested resource doesn't exist.                                     |
| 422 - Unprocessable         | The syntax of the request is correct (often cause of wrong parameter).    |
| 500 - Internal Server Error | We had a problem with our server. Try again later.                        |
| 503 - Service Unavailable   | The server is overloaded or down for maintenance.                         |

## Error types
| Error Type                      | Detail                                                                    |
| -------------------------------:|:--------------------------------------------------------------------------|
| 400 - BadRequestError           | The request was unacceptable, often due to missing a required parameter.  |
| 401 - UnauthorizedError         | No valid API key provided.                                                |
| 404 - NotFoundError             | The requested resource doesn't exist.                                     |
| 422 - UnprocessableError        | The syntax of the request is correct (often cause of wrong parameter).    |
| 500 - InternalServerErrorError  | We had a problem with our server. Try again later.                        |
| 503 - ServiceUnavailableError   | The server is overloaded or down for maintenance.                         |
| 4xx - ClientError               | The error seems to have been caused by the client.                        |
| 5xx - ServerError               | The server is aware that it has encountered an error.                     |

## Example Request
```ruby
begin
  # use Uiza's library to make requests ...
rescue Uiza::Error::BadRequestError => e
  # BadRequestError
  puts "#description_link: {e.description_link}"
  puts "message: #{e.message}"
  puts "code: #{e.code}"
rescue Uiza::Error::UnauthorizedError => e
  # UnauthorizedError
rescue Uiza::Error::NotFoundError => e
  # NotFoundError
rescue Uiza::Error::UnprocessableError => e
  # UnprocessableError
rescue Uiza::Error::InternalServerErrorError => e
  # InternalServerErrorError
rescue Uiza::Error::ServiceUnavailableError => e
  # ServiceUnavailableError
rescue Uiza::Error::ClientError => e
  # ClientError
rescue Uiza::Error::ServerError => e
  # ServerError
rescue Uiza::Error::UizaError => e
  # UizaError
rescue => e
  # Something else happened, completely unrelated to Uiza
end
```
