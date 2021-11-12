
{* Template file *}
{capture name="template"}{include file=ElasticSearch::tpl('hook/vue/autocomplete.html.tpl')}{/capture}
<script type="text/javascript">
  (function () {
    Vue.component('elasticsearch-autocomplete', {
      delimiters: ['%%', '%%'],
      template: "{$smarty.capture.template|escape:'javascript':'UTF-8'}",
      props: ['selected', 'results'],
      methods: {
        suggestionClicked: function (result, event) {
          event.preventDefault();
          window.location.href = result._source['{Elasticsearch::getAlias('link')|escape:'javascript':'UTF-8'}'];
          this.$store.commit('eraseSuggestions');
        }
      }
    });
  }());
</script>
