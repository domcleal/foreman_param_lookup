# foreman_param_lookup

Foreman engine plugin that exposes smart class parameter lookups for any host
and class.

The ENC YAML output that Foreman generates only provides parameters for classes
that are included on the node through the host or hostgroup records.  However
any smart class parameter can be evaluated for a host, so this exposes an API
to do that.

It's designed to be used with the `foreman_data_binding` Puppet module, which
uses this API to resolve class parameters using the matchers configured in
Foreman.  It effectively works in the same way as the Hiera integration in
Puppet 3.

# Installation:

Include in your `~foreman/bundler.d/foreman_param_lookup.rb`

    gem 'foreman_param_lookup'

Or from git:

    gem 'foreman_param_lookup', :git => "https://github.com/domcleal/foreman_param_lookup.git"

As Foreman user:

    bundle install

To upgrade to newest version of the plugin:

    bundle update foreman_param_lookup

# Usage

The URL requires the host (that will be used as context for the smart class
parameter lookup) and the class.  It'll return all parameters for the class in
YAML format.

    $ curl http://foreman/param_lookup?host=host.example.net&class=module::class
    --- 
      module::class: 
        param1: value
        param2: "another value"

# Copyright

Copyright (c) 2013 Red Hat Inc.  See LICENSE.
