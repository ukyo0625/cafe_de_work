module OwnersHelper
  def actived_status(owner)
    owner.is_actived ? '有効' : '無効'
  end
end
