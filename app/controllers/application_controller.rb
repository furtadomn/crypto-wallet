class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    locale = params[:locale] || I18n.default_locale
    if locale
      cookies[:locale] = locale
    end

    if cookies[:locale]
      if I18n.default_locale != cookies[:locale]
        I18n.default_locale = cookies[:locale]
      end
    end
  end
end
