import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  initialize() {
    this.slot1 = document.getElementById('slot1');
    this.slot2 = document.getElementById('slot2');
    this.slot3 = document.getElementById('slot3');
    this.button = document.getElementById('spin-button')
  }

  startSpinning(e) {
    e.target.className = 'unclickable'
    this.slot1.textContent = 'X';
    this.slot2.textContent = 'X';
    this.slot3.textContent = 'X';
  
    const token = document.querySelector("meta[name='csrf-token']").content;
  
    fetch('/game/roll', { method: 'POST' , headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': token,
        }})
      .then((response) => response.json())
      .then((data) => {
        if(data['error']){
          alert(data['error']);
        } else {
          setTimeout(() => {
            this.slot1.textContent = data['result'][0];
          }, 1000);
    
          setTimeout(() => {
            this.slot2.textContent = data['result'][1];
          }, 2000);
    
          setTimeout(() => {
            this.slot3.textContent = data['result'][2];
            document.querySelector('#credits').textContent = `Credits: ${data['credits']}`
            e.target.className = ''
          }, 3000);
        }
      });
  }
}
