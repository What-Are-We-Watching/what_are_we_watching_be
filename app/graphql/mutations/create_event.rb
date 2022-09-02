class Mutations::CreateEvent < Mutations::BaseMutation
  argument :date, String, required: true
  argument :name, String, required: true
  argument :user_id, Integer, required: true

  field :event, Types::EventType, null: false
  field :errors, [String], null: false

  def resolve(date:, name:, user_id:)
    event = Event.new(date: date, name: name, user_id: user_id)

    if event.save
      { event: event, errors: [] }
    else
      { event: nil, errors: event.errors.full_messages }
    end
  end
end
