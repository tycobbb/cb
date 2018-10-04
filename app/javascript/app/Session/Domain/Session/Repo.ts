import { N } from "@S/Support"
import { Id } from "../Entity"
import { Session } from "./Session"

export class Repo {
  private ref: N<Session> = null

  current() {
    if (!this.ref) {
      this.loadSession()
    }

    return this.ref!
  }

  private loadSession() {
    const route = window.location.href.match(/sessions\/(\d+)/)

    if (route == null || route[1] == null) {
      throw new Error("this is only available on the sessions page")
    }

    this.ref = new Session(new Id(route[1]))
  }
}
