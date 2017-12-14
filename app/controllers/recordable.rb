module Recordable
  def record(actor, subject, action)
    record = Record.new(actor, subject, action)
    record.send_event
  end

  class Record
    def initialize(actor, subject, action)
      @params = {
          actor_id: actor.id,
          actor_type: actor.class,
          subject_id: subject.id,
          subject_type: object_type(subject),
          action: action
      }
    end

    def send_event
      response = RestClient.post(
          "http://#{ENV['HISTORY_HOST']}:#{ENV['HISTORY_PORT']}/event",
          @params
      )
      send_event if response.code != 200
    end

    private

    def object_type(subject)
      subject.decorated? ? Draper.undecorate(subject).class : subject.class
    end
  end
end
