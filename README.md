# Toggl API v8

[Toggl](http://www.toggl.com) is a time tracking tool.

[togglv8](/) is a Ruby Wrapper for [Toggl API v8](https://github.com/toggl/toggl_api_docs). It is designed to mirror the Toggl API as closely as possible.

**Note:** Currently togglv8 only includes calls to [Toggl API](https://github.com/toggl/toggl_api_docs/blob/master/toggl_api.md), not the [Reports API](https://github.com/toggl/toggl_api_docs/blob/master/reports.md)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'togglv8'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install togglv8

## Usage

This short example shows one way to create a time entry for the first workspace of the user identified by `<API_TOKEN>`:

```ruby
require 'togglv8'

toggl = Toggl::V8.new(<API_TOKEN>)
user = toggl.me(all=true)
workspaces = toggl.my_workspaces(user)
workspace_id = workspaces.first['id']
toggl.create_time_entry({description: "Workspace time entry",
        wid: workspace_id,
        duration: 1200,
        start: "2015-08-18T01:13:40.000Z",
        created_with: "My awesome Ruby application"})
```

See specs for more examples.

## Acknowledgements

- Thanks to [Koen Van der Auwera](https://github.com/atog) for the [Ruby Wrapper for Toggl API v6](https://github.com/atog/toggl)
- Thanks to the Toggl team for exposing the API.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/togglv8/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

Copyright (c) 2013-2015 Tom Kane. Released under the [MIT License](http://opensource.org/licenses/mit-license.php). See [LICENSE.txt](LICENSE.txt) for details.