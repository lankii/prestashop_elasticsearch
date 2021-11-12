
{* Template file *}
{capture name="template"}{include file=ElasticSearch::tpl('hook/vue/results/pagination.html.tpl')}{/capture}
<script type="text/javascript">
  (function () {
    Vue.component('pagination', {
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
        },
        numbersToShow: function () {
          if (_.indexOf([1, 2], this.page) > -1) {
            return _.range(1, Math.min(6, this.nbPages + 1));
          } else if (_.indexOf([this.nbPages - 1, this.nbPages], this.page) > -1) {
            return _.range(this.nbPages - (Math.min(5, this.nbPages) - 1), this.nbPages + 1);
          }

          return _.range(this.page - 2, this.page + 3);
        }
      },
      methods: {
        setPage: function (page) {
          if (page < 1) {
            page = 1;
          }

          if (page > this.nbPages) {
            page = this.nbPages;
          }

          this.$store.commit('setPage', page);
        }
      }
    });
  }());
</script>
