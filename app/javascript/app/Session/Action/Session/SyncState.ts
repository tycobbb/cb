import { Session } from "@/Session/Domain"

export class SyncState {
  // dependencies
  private sessions: Session.Repo

  // lifecycle
  constructor(sessions = new Session.Repo()) {
    this.sessions = sessions
  }

  call(payload: SyncState.IPayload) {
    const session = this.sessions.current()
    session.setState(payload.state)
  }
}

// payload
export namespace SyncState {
  export interface IPayload {
    state: object
  }
}
