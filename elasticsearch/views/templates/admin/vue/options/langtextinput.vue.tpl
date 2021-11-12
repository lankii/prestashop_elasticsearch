
{capture name="template"}{include file=ElasticSearch::tpl('admin/vue/options/langtextinput.html.tpl')}{/capture}
<script type="text/javascript">
  (function () {
    window.VueLangTextInput = {
      delimiters: ['%%', '%%'],
      template: "{$smarty.capture.template|escape:'javascript':'UTF-8'}",
      props: ['displayName', 'configKey', 'description'],
      methods: {
        setLangValue: function (idLang, event) {
          this.$store.commit('setLangConfig', {
            key: this.configKey,
            value: event.target.value,
            idLang: idLang
          });
        }
      },
      computed: {
        idLang: function () {
          return this.$store.state.idLang;
        },
        value: function () {
          return this.$store.state.config[this.configKey][this.idLang];
        },
        languages: function () {
          return {$languages|json_encode};
        }
      }
    };
  }());
</script>
