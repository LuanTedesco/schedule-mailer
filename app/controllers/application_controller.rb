# encoding: utf-8
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pagy::Backend
end
