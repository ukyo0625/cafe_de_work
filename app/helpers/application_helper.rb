module ApplicationHelper
	include LineSelect
	def line_option(pref)
		prefecture_to_line_select(pref)
	end
	def station_option(line)
		line_to_station_select(line)
	end
end
