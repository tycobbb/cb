export class Card {
  readonly id: string

  // lifecycle
  constructor(id: string) {
    this.id = id
  }

  // description
  name: string = ""
  text: string = ""
}
