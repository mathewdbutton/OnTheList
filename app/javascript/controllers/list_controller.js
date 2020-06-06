import ApplicationController from './application_controller'

/* This is the custom StimulusReflex controller for ListReflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {
  static targets = ["itemName", "listName"]

  createItem() {
    const itemData = this.itemNameTarget.value;
    this.stimulate('ItemReflex#create_item', { list_id: this.listId, name: itemData });
  }

  createList() {
    const listData = this.listNameTarget.value;
    this.stimulate('ListReflex#create_list', { name: listData });
    this.listNameTarget.value = "";
  }

  deleteList(event) {
    event.preventDefault()
    const listId = event.originalTarget.dataset["listId"]
    this.stimulate('ListReflex#delete_list', listId);
  }
}
