import Typed from 'typed.js';

let typed = () => {
    new Typed('#firstMessage', {
      strings: ["Let's get started!", "What's your name?"],
      typeSpeed: 45,
      loop: false
    });
  };

let two = (name) => {
  new Typed('#two', {
    strings: [`Ok ${name}`,"what job titles are you looking for?"],
    typeSpeed: 45,
    loop: false
    });
};
let three = () => {
    new Typed('#three', {
      strings: ["Where do you want to work?"],
      typeSpeed: 45,
      loop: false
    });
  };
let four = (location) => {
  new Typed('#four', {
    strings: [`Do you need a visa to work in ${location}?`],
    typeSpeed: 45,
    loop: false
  });
};
let five = () => {
  new Typed('#five', {
    strings: ["What programming languages do you know?"],
    typeSpeed: 45,
    loop: false
  });
};
let six = () => {
  new Typed('#six', {
    strings: ["What human languages do you speak?"],
    typeSpeed: 45,
    loop: false
  });
};
let seven = () => {
  new Typed('#seven', {
    strings: ["What's your minimum total compensation (full year)?"],
    typeSpeed: 45,
    loop: false
  });
};
let eight = () => {
  new Typed('#eight', {
    strings: ["How many years of professional experience do you have?"],
    typeSpeed: 45,
    loop: false
  });
};
let nine = () => {
  new Typed('#nine', {
    strings: ["What's your education level?"],
    typeSpeed: 45,
    loop: false
  });
};
let ten = () => {
  new Typed('#ten', {
    strings: ["What type of employment are you looking for?"],
    typeSpeed: 45,
    loop: false
  });
};
let eleven = () => {
  new Typed('#eleven', {
    strings: ["Would you like to add any keywords such as 'Fintech', 'Startup', or 'Market leader'?"],
    typeSpeed: 45,
    loop: false
  });
};
let twelve = () => {
  new Typed('#twelve', {
    strings: ["Are you interested in jobs posted over 30 days ago?"],
    typeSpeed: 45,
    loop: false
  });
};
export { typed, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve };
