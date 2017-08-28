class BaseController < ApplicationController
  include Recordable
  before_action :authenticate_admin!
end
