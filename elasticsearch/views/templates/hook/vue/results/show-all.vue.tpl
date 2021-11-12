
{* Template file *}
{capture name="template"}{include file=ElasticSearch::tpl('hook/vue/results/show-all.html.tpl')}{/capture}
<script type="text/javascript">
  (function () {
    Vue.component('show-all', {
      delimiters: ['%%', '%%'],
      template: "{$smarty.capture.template|escape:'javascript':'UTF-8'}",
      methods: {
        showAllHandler: function () {
          this.$store.commit('setLimit', 10000);
        }
      }
    });
  }());
</script>
