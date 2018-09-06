import { h } from "preact"
import { Card } from "./Card"

interface Props {
  card: Card
}

export const Cell = ({ card }: Props) => (
  <article className="Card">
    <img className="CardImage" />
    <div class="Card-content">
      <p class="Card-name">{card.name}</p>
      <p class="Card-text">{card.text}</p>
    </div>
  </article>
)
