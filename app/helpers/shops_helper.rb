module ShopsHelper
	def holiday(wday)
		weeks = {0 => "日曜日",1 => "月曜日",2 => "火曜日",3 => "水曜日",4 => "木曜日",5 => "金曜日",6 => "土曜日"}
		weeks[wday]
	end
end
