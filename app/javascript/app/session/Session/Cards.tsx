import { h } from "preact"
import { State } from "./State"
import * as Card from "../Card"

export const Cards = () => (
  <State.Consumer
    render={(state) => (
      <section className="Cards">
        {state.cards.map((card) => (
          <Card.Cell card={card} />
        ))}
      </section>
    )}
  />
)
