import { h } from "preact"
import { State } from "./State"
import { Cards } from "./Cards"

export const View = (_props) => (
  <section className="Session">
    <State.Provider />
    <Cards />
  </section>
)
