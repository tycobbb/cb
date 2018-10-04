import { Channel } from "@/Session/Service"
import { Session } from "@/Session/Domain"
import { SyncState } from "./SyncState"

type Event
  = IEvent<EventType.SYNC_STATE, SyncState.IPayload>

enum EventType {
  SYNC_STATE = "sync-state"
}

interface IEvent<T extends EventType, P> {
  type:    T
  payload: P
}

export class Connect {
  // dependencies
  private channel:  Channel.Service
  private sessions: Session.Repo

  // lifecycle
  constructor(
    channel  = new Channel.Service("Sessions::RootChannel"),
    sessions = new Session.Repo()
  ) {
    this.channel  = channel
    this.sessions = sessions
  }

  call() {
    const session = this.sessions.current()
    const handler = this.createHandler()
    this.channel.subscribe(session.id.value, handler)
  }

  // event handler
  private createHandler(): typeof Channel.Handler {
    return {
      ...Channel.Handler,
      received: (event: Event) => {
        switch (event.type) {
          case EventType.SYNC_STATE:
            new SyncState(this.sessions).call(event.payload); break
          default:
            throw new Error("unknwon event type")
        }
      }
    }
  }
}
