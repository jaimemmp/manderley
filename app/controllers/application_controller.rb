class ApplicationController < ActionController::Base

  before_action :set_locale
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private
  
  def set_locale
    #I18n.default_locale = :es
    #browser_lang = request.accept_language.split(',').first
    browser_lang = "en"
    I18n.available_locales.include?(browser_lang) ? I18n.locale = browser_lang : I18n.locale = I18n.default_locale
  end
end
