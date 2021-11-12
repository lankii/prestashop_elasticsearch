
{* Template file *}
{capture name="template"}{include file=ElasticSearch::tpl('hook/vue/results/product-count.html.tpl')}{/capture}
<script type="text/javascript">
  (function () {
    Vue.component('product-count', {
      delimiters: ['%%', '%%'],
      template: "{$smarty.capture.template|escape:'javascript':'UTF-8'}",
      props: ['limit', 'offset', 'total'],
      computed: {
        page: function () {
          if (!this.offset) {
            return 1;
          }

          return Math.ceil(this.offset / this.limit)  + 1;
        },
        nbPages: function () {
          return Math.ceil(this.total / this.limit);
        }
      }
    });
  }());
</script>
