# модель auth внутри класса user, что бы подключить просто по имени Auth
# механизм Constant Autoloading, скринкаст Аутентификация- 20:19
# чтобы подгружать без require, автоматически
# нужно создать каталог имя-так же как и наш класс, а внутри создать файл имя-
# так же как наш модуль и добавить его в пространство имен User

module User::Auth

  extend ActiveSupport::Concern
  # виртульные атрибуты
  attr_reader :password
  attr_writer :password_confirmation

  included do
      validates :email, presence: true
      # следующую валидацию выполняем только если в хэш еще ничего не записано (прок - проверка что хэш пуст).
      validates :password, presence: true, if: Proc.new { |u| u.password_digest.blank? }
      validates :password, confirmation: true
  end

  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil
    elsif password_string.present?
      @password = password_string
      self.password_digest = digest(password_string)
    end
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end

end
