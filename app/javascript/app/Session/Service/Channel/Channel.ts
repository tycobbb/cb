import ActionCable, { CreateMixin } from "actioncable"

export class Channel {
  private name: string

  constructor(name: string) {
    this.name = name
  }

  // state
  private ids = new Set<string>()
  private consumer = ActionCable.createConsumer()

  // subscription
  subscribe(id: string, handler: CreateMixin) {
    const isNewSubscription = this.ids.has(id)

    if (!isNewSubscription) {
      this.addSubscription(id, handler)
    }

    return isNewSubscription
  }

  private addSubscription(id: string, handler: CreateMixin) {
    this.ids.add(id)
    const subscriptionId = { channel: this.name, id }
    this.consumer.subscriptions.create(subscriptionId, handler)
  }
}
