import ApplicationController from './application_controller'

/* This is the custom StimulusReflex controller for ListReflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {
  static targets = ["itemName"]

  createItem(event) {
    const itemData = this.itemNameTarget.value;
    this.stimulate('ItemReflex#create_item', { listId: this.listId, itemData: { name: itemData } });
  }

  deleteItem(event) {
    event.preventDefault()
    const itemId = event.originalTarget.dataset["itemListId"]
    this.stimulate('ItemReflex#delete_item', itemId);
  }

  get listId() {
    return Number(this.data.get("list-id"))
  }
}
