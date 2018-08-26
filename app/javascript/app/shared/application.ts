import { Application, Controller } from "stimulus"

let shared: Application | null = null

export function application() {
  if (shared == null) {
    shared = Application.start()
  }

  return shared
}

export function register(
  name: string,
  constructor: typeof Controller
) {
  application().register(name, constructor)
}
