import noUiSlider from 'nouislider';

const initSlider = (elementId) => {
  const slider = document.getElementById(elementId);
  noUiSlider.create(slider, {
      start: [100000, 900000],
      connect: true,
      range: {
          'min': 0,
          'max': 1000000
      }
  });
}
const initRangeSlider = (elementId) => {
  const rangeSlider = document.getElementById(elementId);
  noUiSlider.create(rangeSlider, {
    start: 1,
    behaviour: 'tap',
    connect: [false, true],
    range: {
        'min': 0,
        'max': 50
    }
});
}
export { initSlider }
export { initRangeSlider }
