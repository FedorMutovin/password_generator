class PasswordsController < ApplicationController
  def new; end

  def create
    @password = PasswordsGenerator.new(params[:length]).call
  end
end
