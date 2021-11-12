
{* Template file *}
{capture name="template"}{include file=ElasticSearch::tpl('hook/vue/column.html.tpl')}{/capture}
<script type="text/javascript">
  (function () {
    function ready(fn) {
      if (document.readyState !== 'loading') {
        fn();
      } else if (document.addEventListener) {
        document.addEventListener('DOMContentLoaded', fn);
      } else {
        document.attachEvent('onreadystatechange', function() {
          if (document.readyState !== 'loading') {
            fn();
          }
        });
      }
    }

    ready(function () {
      var target = document.getElementById('elasticsearch-column-right');
      var shouldShow = {if Configuration::get(Elasticsearch::INSTANT_SEARCH) || $smarty.get.controller === 'search' && $smarty.get.module === 'elasticsearch'}true{else}false{/if};

      if (typeof target !== 'undefined' && shouldShow) {
        new Vue({
          el: target,
          template: '<elasticsearch-column position="right"></elasticsearch-column>',
        });
      }
    });
  }());
</script>
