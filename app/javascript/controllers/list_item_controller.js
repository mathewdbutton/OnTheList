import ApplicationController from './application_controller'

export default class extends ApplicationController {

  initialize() {
    this.setFocus()
  }

  formSubmit() {
    this.setFocus()
    this.clearValue()
  }
}
