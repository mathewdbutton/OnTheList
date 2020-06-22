import ApplicationController from './application_controller'

/* This is the custom StimulusReflex controller for ListReflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {
  static targets = ["itemName", "itemQuantity"]

  createListItem(event) {
    event.preventDefault()
    const itemId = event.target.dataset["itemId"]
    const itemName = this.itemNameTarget.value;
    const itemQuantity = this.itemQuantityTarget.value;
    this.stimulate('ListItemReflex#create_list_item', { listId: this.listId, itemName, itemId, itemQuantity });
  }

  get listId() {
    return Number(this.data.get("list-id"))
  }
}
