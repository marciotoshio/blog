require 'date'

module Jekyll
  module AssetFilter
    def my_age(input)
      now = Time.now.utc.to_date
		  now.year - input.year - ((now.month > input.month || (now.month == input.month && now.day >= input.day)) ? 0 : 1)
    end
  end
end

Liquid::Template.register_filter(Jekyll::AssetFilter)