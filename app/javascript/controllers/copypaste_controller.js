import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // Targets can be input text, div or span
  static targets = ['content', 'action', 'btn', 'feedback']

  copy(){
    const copiedText = this.contentTarget.value? this.contentTarget.value : this.contentTarget.innerText 
    navigator.clipboard.writeText(copiedText)
    this.btnTarget.classList.add('hidden')
    this.feedbackTarget.classList.remove('hidden')
    this.element.classList.add('bg-slate-100')
    this.actionTarget.classList.add('bg-green-100')
    setTimeout(() => {
      this.actionTarget.classList.remove('bg-green-100')
      this.btnTarget.classList.remove('hidden')
      this.feedbackTarget.classList.add('hidden')
      this.element.classList.remove('bg-slate-100')
    }, 900);
  }
}
