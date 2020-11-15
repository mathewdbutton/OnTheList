import ApplicationController from './application_controller'

export default class extends ApplicationController {

  static targets = ["itemName", "itemQuantity"]

  initialize() {
    this.setFocus()
  }

  formSubmit() {
    this.setFocus()
    this.clearValue()
  }

  autocompleteItem(event) {
    this.stimulate('ListItem#autocomplete_item', this.itemNameTarget.value, this.itemQuantityTarget.value)
  }
}
