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

Get the foreman_data_binding module from [Puppet Forge](http://forge.puppetlabs.com/domcleal/foreman_data_binding)
or [GitHub](https://github.com/domcleal/foreman_data_binding).

# Installation:

Include in your `~foreman/bundler.d/foreman_param_lookup.rb`

    gem 'foreman_param_lookup'

Or from git:

    gem 'foreman_param_lookup', :git => "https://github.com/domcleal/foreman_param_lookup.git"

As Foreman user:

    bundle install

To upgrade to newest version of the plugin:

    bundle update foreman_param_lookup

Don't forget to install the Puppet module to use that functionality.

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

Copyright (c) 2013 Red Hat Inc.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
