export class Entity {
  readonly id: Id

  constructor(id: Id) {
    this.id = id
  }

  equals(other: this) {
    return this.id.equals(other.id)
  }
}

export class Id {
  readonly value: string

  constructor(value: string) {
    this.value = value
  }

  equals(other: Id): boolean {
    return this.value === other.value
  }
}
