class PerformedActionsController < ApplicationController
  def index
    @performed_actions = PerformedAction.all
  end
end
