import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  //on start
  connect() {
    console.log('connected');
    const messages = document.getElementById('messages');
    messages.addEventListener('DOMNodeInserted', this.resetScroll);
  }
  // on stop
  disconnect() {
    console.log('disconnected');
    document.removeEventListener("DOMNodeInserted", this.resetScroll);
  }
  // custome function
  resetScroll() {
    messages.scrollTop = messages.scrollHeight - messages.clientHeight;
  }
}
