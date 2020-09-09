import ApplicationController from './application_controller'

export default class extends ApplicationController {

  initialize() {
    this.setFocus()
  }

  doThing() {
    this.setFocus()
    this.clearValue()
  }

  get listId() {
    return Number(this.data.get("list-id"))
  }
}
