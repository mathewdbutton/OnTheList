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

  afterAutocompleteItem() {
    if (window.screen.width > 500) return;
    this.scrollTo()
  }

  autocompleteItem(event) {
    this.stimulate('ListItem#autocomplete_item', this.itemNameTarget.value, this.itemQuantityTarget.value)
  }

  scrollTo() {
    const scrollToElement = document.querySelector("#scrollTo")
    const elementPosition = scrollToElement.getBoundingClientRect().top + window.pageYOffset
    const offsetPosition = elementPosition - 10

    window.scrollTo({
      top: offsetPosition,
      behavior: 'smooth'
    })
  }


}
