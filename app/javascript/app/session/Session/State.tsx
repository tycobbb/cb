import { h } from "preact"
import { createContext } from "preact-context"
import { Card } from "../Card"

// state
interface State {
  cards: Card[]
}

const initialState: () => State = () => ({
  cards: [{
    name: "Card 1",
    text: "A great card, to be sure."
  }, {
    name: "Card 2",
    text: "Also, but not quite as, great."
  }]
})

// decompose state context
const { Consumer, Provider } = createContext(initialState())

export const State = {
  Consumer,
  Provider: () => (
    <Provider
      value={initialState()}
    />
  )
}
