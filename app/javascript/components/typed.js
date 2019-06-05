import Typed from 'typed.js';

let typed = (id, messages) => {
  if (document.getElementById(id)) {
    new Typed(`#${id}`, {
      strings: messages,
      typeSpeed: 45,
      loop: false
    });
  }
};

export { typed };
