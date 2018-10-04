import { N } from "@S/Support"
import { Entity } from "../Entity"
import { Card } from "../Card"

export class Session extends Entity {
  // cards
  readonly cards: Card[] = []

  // state
  private state: N<object> = null

  setState(state: object) {
    this.state = state
  }
}
