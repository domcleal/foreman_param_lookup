class ForemanParamLookup::AnyClassification < Classification::ClassParam
  include LookupKeysHelper
  include HostsHelper

  def initialize args = { }
    super args
    @classes = args[:classes]
  end

  def enc
    hash = @classes.map do |puppet_class|
      lookup_keys   = overridable_lookup_keys(puppet_class, @host)
      lookup_values = lookup_keys.map { |lookup_key|
      
        if lookup_key.use_puppet_default
          value = lookup_key.default_value
        else
          lookup_value = @host.lookup_values.detect { |v| v.lookup_key_id == lookup_key.id }
          value = lookup_value.value unless lookup_value.nil?
        end

        [lookup_key.key, value]
      }.compact

      [puppet_class.name, Hash[lookup_values]] unless lookup_values.empty?
    end

    Hash[hash.compact]
  end

  private

  def puppetclass_ids
    @classes.map {|c| c.id}
  end
end
