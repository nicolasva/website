class LanguagesController < ApplicationController
  def show
    session['language'] = params[:id]
    I18n.locale = session['language']
    redirect_to(:back)
  end
end
