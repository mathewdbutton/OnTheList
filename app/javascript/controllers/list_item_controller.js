import ApplicationController from './application_controller'

const CreateListItemReflex = 'ListItemReflex#create_list_item'

export default class extends ApplicationController {
  static targets = ["itemName", "itemQuantity"]

  initialize() {
    this.setFocus()
  }

  createListItem(event) {
    event.preventDefault()
    const itemName = this.itemNameTarget.value
    if (itemName === "") return
    const itemId = event.target.dataset["itemId"]
    const itemQuantity = this.itemQuantityTarget.value;
    this.stimulate(CreateListItemReflex, { listId: this.listId, itemName, itemId, itemQuantity });
  }

  afterReflex(_element, reflex) {
    if (reflex === CreateListItemReflex) this.setFocus()
  }

  get listId() {
    return Number(this.data.get("list-id"))
  }
}
