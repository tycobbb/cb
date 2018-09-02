import { h, render } from "preact"
import { Session } from "../app/session"

const root = document.getElementById("session-root")
root && render(<Session />, root)
