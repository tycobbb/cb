import { h } from "preact"
import * as Card from "../Card"

const cards = []

const NoCards = () => (
  <p>No Cards.</p>
)

export const Cards = () => (
  <section className="Cards">
    {cards.length === 0 ? <NoCards /> : cards.map((card) => (
      <Card.Cell card={card} />
    ))}
  </section>
)
