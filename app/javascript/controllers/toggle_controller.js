import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['toggleable']

  hide(e) {
    e.preventDefault()

    this.toggleableTarget.hidden = true
  }

  show(e) {
    e.preventDefault()

    this.toggleableTarget.hidden = false
  }
}
