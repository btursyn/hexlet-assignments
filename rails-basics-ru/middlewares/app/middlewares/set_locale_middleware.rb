# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    # Извлекаем заголовок локали
    locale = env['HTTP_ACCEPT_LANGUAGE']
    
    # Проверяем, есть ли заголовок и не пустой ли он
    if locale && !locale.empty?
      # Извлекаем первый языковой тег из заголовка
      locale = locale.scan(/^[a-z]{2}/).first
      # Устанавливаем локаль, если она поддерживается приложением
      I18n.locale = locale if I18n.available_locales.include?(locale.to_sym)
    else
      # Используем стандартную локаль, если заголовок отсутствует или пуст
      I18n.locale = I18n.default_locale
    end

    # Передаем управление дальше по цепочке миддлваров или приложению
    @app.call(env)
  end  
  # END
end
