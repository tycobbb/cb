import { h, Component } from "preact"
import { Session } from "@/Session/Action"
import { Cards } from "./Cards"

export class View extends Component<{}, {}> {
  connect = new Session.Connect()

  // lifecycle
  componentDidMount() {
    this.connect.call()
  }

  render() {
    return (
      <section className="Session">
        <Cards />
      </section>
    )
  }
}
