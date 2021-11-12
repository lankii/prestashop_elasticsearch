
<script type="text/javascript">
  (function () {
    Vue.component('debug', {
      template: "<!-- debug -->",
      props: [
        "item"
      ],
      created: function () {
        console.log("debug", this.item);
        debugger
      }
    });
  }());
</script>
