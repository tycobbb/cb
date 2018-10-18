import { Application as App } from "stimulus"

let _ref: App | null = null

export function app() {
  if (_ref == null) {
    _ref = App.start()
  }

  return _ref
}
