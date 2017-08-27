class PerformedActionsController < ApplicationController
  def index
    @search = PerformedAction.ransack(params[:q])
    @performed_actions = @search.result(distinct: true).decorate
  end
end
