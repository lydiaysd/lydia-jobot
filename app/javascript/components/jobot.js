import $ from 'jquery'
import Typed from 'typed.js';
import { typed } from '../components/typed';

const botScript = (e) => {
  if (e.key === 'Enter' || e.type === 'click') {
    if (e.key === 'Enter') {
      e.preventDefault();
    }
    const div = e.currentTarget.closest('.bot-div');
    const nextDiv = div.nextElementSibling;
    $('.select2-container--open').remove();
    if (!nextDiv) {
      return
    }
    const nextInputs = nextDiv.querySelectorAll('.bot-input');
    nextDiv.removeAttribute('hidden');
    div.setAttribute('hidden', true);
    nextInputs.forEach(nextInput => {
      if (nextInput.type === 'text') {
        nextInput.focus();
        nextInput.addEventListener('keydown', botScript)
      } else if (nextInput.type === 'radio') {
        nextInput.addEventListener('click', botScript)
      } else if (nextInput.type === 'select-multiple') {
        nextInput.parentNode.addEventListener('keydown', botScript)
      }
    });
    console.log(div.id);
    switch(div.id) {
      case 'bot-start':
        const name = e.currentTarget.value
        typed('two', [`Ok ${name},`,"What job titles are you looking for?"]);
        break;
      case 'bot-name':
        typed('three', ["Where do you want to work?"]);
        break;
      case 'bot-location':
        const location = e.currentTarget.value
        typed('four', [`Do you need a visa to work in ${location}?`]);
        break;
      case 'bot-visa':
        typed('five', ["What programming skills do you have?"]);
        break;
      case 'bot-program':
        typed('six', ["What human languages do you speak?"]);
        break;
      case 'bot-language':
        typed('seven', ["What's your minimum total compensation (full year)?"]);
        break;
      case 'bot-money':
        typed('eight', ["How many years of professional experience do you have?"]);
        break;
      case 'bot-experience':
        typed('nine', ["What's your highest level of completed education?"]);
        break;
      case 'bot-education':
        typed('ten', ["What type of employment are you looking for?"]);
        break;
      case 'bot-employment':
        typed('eleven', ["Would you like to add any keywords such as 'Fintech' or 'Startup'?"]);
        break;
      case 'bot-keyword':
        typed('twelve', ["Are you interested in jobs posted more than two weeks ago?"]);
        break;
    }
  }
}

if (document.getElementById('bot-start')) {
  document.getElementById('bot-start').querySelector('input').addEventListener('keydown', botScript)
}
