import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2();
};

export { initSelect2 };

const pillBoxSelect2 = () => {
  $('.js-example-basic-multiple').select2();
};

export { pillBoxSelect2 };
