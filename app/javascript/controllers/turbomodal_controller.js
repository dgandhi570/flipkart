import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="turbomodal"
export default class extends Controller {
  connect(e) {
    if(e.detail.success){
      this.hideElement()
    }
  }
hideElement(){
  this.element.remove()
}

}
