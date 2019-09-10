module FlashHelper

  def test_flash_helper
    'it is FlashHelper'
  end

  def flash_alert
    if flash[:alert]
       content_tag :p, flash[:alert], class: 'flash alert'
    end
  end
end
