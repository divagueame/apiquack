import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autosubmit"
export default class extends Controller {
  static targets = ["queryField"]
  initialize() {
    this.timeout = null
  }
  debouncedSubmit(){
    if(this.timeout) {
      clearTimeout(this.timeout)
    }
    this.timeout = setTimeout(() => {
      this.submit()
    }, 300)

  }
  submit(){
    this.element.requestSubmit()
  }
  resetForm() {
    console.log(this.queryFieldTarget.value)
    this.queryFieldTarget.value = ''
    this.submit()
  }
  triggerSelect(e){
    const endpointId = parseInt(e.target.dataset.val)
    const hiddeni = document.getElementById('endpoint_id')
    hiddeni.value = endpointId
    this.submit()
  }
}
