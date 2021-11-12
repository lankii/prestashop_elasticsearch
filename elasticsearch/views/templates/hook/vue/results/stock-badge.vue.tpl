
{* Template file *}
{capture name="template"}{include file=ElasticSearch::tpl('hook/vue/results/stock-badge.html.tpl')}{/capture}
<script type="text/javascript">
  (function () {
    Vue.component('stock-badge', {
      delimiters: ['%%', '%%'],
      template: "{$smarty.capture.template|escape:'javascript':'UTF-8'}",
      props: ['item']
    });
  }());
</script>
