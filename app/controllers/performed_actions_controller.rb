class PerformedActionsController < ApplicationController
  def index
    @search = PerformedAction.ransack(params[:q])
    @performed_actions = History::PerformedActionDecorator.decorate_collection(@search.result(distinct: true))
  end
end
