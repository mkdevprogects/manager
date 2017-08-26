module Recordable
  def record(actor, subject, action)
    PerformedAction.create(actor: actor, subject: subject, action: action)
  end
end