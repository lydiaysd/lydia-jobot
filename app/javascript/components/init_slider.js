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
  // Update the text and hidden input field dynamically
  // slider.noUiSlider.on('update', function(values, handle) => {
  //   const totalCompensation = document.getElementById('totalCompensation');
  //   const money = Math.round(slider.noUiSlider.get());
  //   console.log(money)
  //   // priceSliderText.innerHTML = '£' + currentPrice;
  //   totalCompensation.value = money;
  // });

  var snapValues = [
      document.getElementById('total_compensation_lower'),
      document.getElementById('total_compensation_upper')
  ];
  slider.noUiSlider.on('update', function (values, handle) {
      const totalCompensation = document.getElementById('totalCompensation');
      console.log(handle)
      snapValues[handle].innerHTML = values[handle];
      totalCompensation.value = `${snapValues[0].innerHTML}-${snapValues[1].innerHTML}`
  });
}



const initOneHandleSlider = (elementId) => {
  const oneHandleSlider = document.getElementById(elementId);
  noUiSlider.create(oneHandleSlider, {
    start: document.querySelector('.years_experience').innerHTML,
    behaviour: 'tap',
    connect: [true, false],
    range: {
        'min': 0,
        'max': 50
    }
  });

  // Update the text and hidden input field dynamically
  oneHandleSlider.noUiSlider.on('update', () => {
    const yearsExperience = document.getElementById('yearsExperience');
    const years = Math.round(oneHandleSlider.noUiSlider.get());
    // priceSliderText.innerHTML = '£' + currentPrice;
    yearsExperience.value = years;
  });
}
export { initSlider }
export { initOneHandleSlider }
