import { h, render } from "preact"
import { Session } from "@/Session/View"

const root = document.getElementById("session-root")
root && render(<Session />, root)
