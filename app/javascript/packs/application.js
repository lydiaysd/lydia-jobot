// app/javascript/packs/application.js
// Requiring CSS! Path is relative to ./node_modules
import $ from 'jquery'
import "bootstrap";
import 'select2/dist/css/select2.css';
import 'nouislider/distribute/nouislider.css';
// import { initSlider } from '../components/init_slider';
import { initOneHandleSlider } from '../components/init_slider';
import { initSelect2 } from '../components/init_select2';
import { typed } from '../components/typed';
typed('firstMessage', ["Let's find you some jobs!", "I can't read minds [ yet ], so before we start I'll need to ask a few questions...", "To begin, what's your name?"]);
import '../components/jobot';

initSelect2('select2');
initSelect2('js-example-basic-multiple');
initOneHandleSlider('experience_slider');
// initSlider('compensation_slider');
// initSlider('compensation_slider');
// import { initAutocomplete } from '../plugins/init_autocomplete';
// initAutocomplete();

// DOWN ARROW INDEX PAGE

// $(function() {
//   $('a[href*=#]').on('click', function(e) {
//     e.preventDefault();
//     $('html, body').animate({ scrollTop: $($(this).attr('href')).offset().top}, 500, 'linear');
//   });
// });

// LOADING PAGE JS BELOW





