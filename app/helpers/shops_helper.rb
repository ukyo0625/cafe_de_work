module ShopsHelper
	def holiday(wday)
		weeks = {0 => "日曜日",1 => "月曜日",2 => "火曜日",3 => "水曜日",4 => "木曜日",5 => "金曜日",6 => "土曜日"}
		weeks[wday]
	end
  #show画面でholiday_numberを曜日で返す
  def active_status(shop)
    shop.is_active ? '有効' : '無効'
  end
  #有効無効を判別し、有効なら有効と表示し無効なら無効と表示する
  def favorite_status(shop)
    shop.is_favorite ? '表示' : '非表示'
  end
end
