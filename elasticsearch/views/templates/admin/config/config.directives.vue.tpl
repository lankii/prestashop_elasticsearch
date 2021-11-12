
<script type="text/javascript">
  (function () {
    Vue.directive('digitsonly',
      function (el, binding) {
        if (!/^[\d\.]+$/i.test(el.value)) {
          el.value = el.value.replace(/[a-zA-Z]+/ig, '');
          binding.value = el.value;
        }
      });
  }());
</script>
