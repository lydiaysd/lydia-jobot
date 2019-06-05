import $ from 'jquery'
import Typed from 'typed.js';
import { typed, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve } from '../components/typed';

const botScript = (e) => {
  if (e.key === 'Enter' || e.type === 'click') {
    if (e.key === 'Enter') {
      e.preventDefault()
    }
    const div = e.currentTarget.closest('.bot-div')
    const nextDiv = div.nextElementSibling
    $('.select2-container--open').remove()
    if (!nextDiv) {
      return
    }
    const nextInputs = nextDiv.querySelectorAll('.bot-input')
    nextDiv.removeAttribute('hidden')
    div.setAttribute('hidden', true)
    nextInputs.forEach(nextInput => {
      if (nextInput.type === 'text') {
        nextInput.addEventListener('keydown', botScript)
      } else if (nextInput.type === 'radio') {
        nextInput.addEventListener('click', botScript)
      } else if (nextInput.type === 'select-multiple') {
        nextInput.parentNode.addEventListener('keydown', botScript)
      }
    })
    switch(div.id) {
      case 'bot-start':
        const name = e.currentTarget.value
        two(name);
        break;
      case 'bot-name':
        three();
        break;
      case 'bot-location':
        const location = e.currentTarget.value
        four(location);
        break;
      case 'bot-visa':
       five();
        break;
      case 'bot-program':
        six();
        break;
      case 'bot-language':
        seven();
        break;
      case 'bot-money':
        eight();
        break;
      case 'bot-experience':
        nine();
        break;
      case 'bot-industries':
        ten();
        break;
      case 'bot-education':
        eleven();
        break;
      case 'bot-employment':
        twelve();
        break;
    }
  }
}

if (document.getElementById('bot-start')) {
  document.getElementById('bot-start').querySelector('input').addEventListener('keydown', botScript)
}
