class Mutations::JoinEvent < Mutations::BaseMutation 
  argument :event_id, Integer, required: true
  argument :user_id, Integer, required: true
  argument :status, Integer, required: true

  field :event, Types::EventType, null: false
  field :errors, [String], null: false
  
  def resolve(event_id:, user_id:, status:)
    event=Event.find(event_id)
    event.update(guest_id: user_id, status: 1)

    if (event.save)
      {
        event: event,
        errors: []
      }
    else
      {
        event: nil,
        errors: event.errors.full_messages
      }
    end
  end

end