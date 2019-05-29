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

export { initSlider }
