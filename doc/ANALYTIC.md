## Analytic
Monitor the four key dimensions of video QoS: playback failures, startup time, rebuffering, and video quality.
These 15 metrics help you track playback performance, so your team can know exactly what’s going on.

See details [here](https://docs.uiza.io/#analytic).

## Total Line
Get data grouped by hour (data refresh every 5 minutes). Track video playback on any metric performance, so you can know exactly what’s happening on every user’s device and debug more effectively.

See details [here](https://docs.uiza.io/#total-line).

```ruby
require "uiza"

Uiza.workspace_api_domain = "your-workspace-api-domain.uiza.co"
Uiza.authorization = "your-authorization"

params = {
  start_date: "YYYY-MM-DD hh:mm",
  end_date: "YYYY-MM-DD hh:mm",
  metric: "rebuffer_count"
}

begin
  response = Uiza::Analytic.get_total_line params
  puts response.first.rebuffer_count
rescue Uiza::Error::UizaError => e
  puts "description_link: #{e.description_link}"
  puts "code: #{e.code}"
  puts "message: #{e.message}"
rescue StandardError => e
  puts "message: #{e.message}"
end
```

Example Response
```ruby
{
 "date_time": 1542978000000,
 "rebuffer_count": 1.6666666666666667
},
{
 "date_time": 1543215600000,
 "rebuffer_count": 5
}
```
