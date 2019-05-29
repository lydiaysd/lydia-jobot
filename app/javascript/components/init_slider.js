import noUiSlider from 'nouislider'

const initSlider = () => {
  const slider = document.querySelector('.slider');
    noUiSlider.create(slider, {
      start: [Number.parseInt(priceSliderInput.value,10) || 100],
      step: 1,
      range: {
          'min': [0],
          'max': [100]
      },
      connect: [true, false]
    });
}

export { initSlider }
