
{capture name="template"}{include file=ElasticSearch::tpl('admin/vue/options/filter-meta-list.html.tpl')}{/capture}
<script type="text/javascript">
  (function () {
    window.VueFilterMetaList = {
      delimiters: ['%%', '%%'],
      template: "{$smarty.capture.template|escape:'javascript':'UTF-8'}",
      components: {
        MetaBadge: VueMetaBadge
      },
      props: ['displayName', 'configKey', 'description'],
      mounted: function () {
        var self = this;
        this.$nextTick(function () {
          $('span[data-toggle="tooltip"]').tooltip();
          var $sortable = $('.sortable');
          $sortable.sortable({
            forcePlaceholderSize: true,
            start: function(event, ui) {
              ui.item.startPos = ui.item.index();
            },
            update: function (event, ui) {
              self.$store.commit('setNewMetaPosition', {
                configKey: self.configKey,
                from: ui.item.startPos,
                to: ui.item.index()
              });
            }
          });
        });
      },
      methods: {
        updateLanguage: function (idLang) {
          this.$store.commit('setIdLang', idLang);
        },
        updateMetaName: function (code, idLang, event) {
          this.$store.commit('setMetaName', {
            configKey: this.configKey,
            code: code,
            value: event.target.value,
            idLang: idLang
          });
        },
        filterLimitChanged: function (meta, event) {
          this.$store.commit('setMetaFilterLimit', {
            configKey: this.configKey,
            code: meta.code,
            value: event.target.value
          });
        },
        filterStyleChanged: function (meta, event) {
          this.$store.commit('setMetaFilterStyle', {
          configKey: this.configKey,
            code: meta.code,
            value: event.target.value
          });
        },
        operatorChanged: function (meta, event) {
          this.$store.commit('setMetaOperator', {
            configKey: this.configKey,
            code: meta.code,
            value: event.target.value
          });
        },
        toggleMetaAggregatable: _.debounce(function (meta, event) {
          this.$store.commit('setMetaAggregatable', {
            configKey: this.configKey,
            code: meta.code,
            value: !meta.aggregatable
          });

          // Regular switch events
          toggleDraftWarning(false);
          showOptions(true);
          showRedirectProductOptions(false);
        }, 10)
      },
      computed: {
        metas: function () {
          return this.$store.state.config[this.configKey];
        },
        idLang: function () {
          return this.$store.state.idLang;
        },
        languages: function () {
          return {$languages|json_encode};
        },
        nbAggregatable: function () {
          return _.sumBy(this.$store.state.config[this.configKey], function (i) {
            return i.aggregatable ? 1 : 0;
          });
        }
      },
      data: function () {
        return {
          checked: true
        };
      }
    };
  }());
</script>
