
{capture name="template"}{include file=ElasticSearch::tpl('admin/vue/options/query-json.html.tpl')}{/capture}
<script type="text/javascript">
  (function () {
    window.VueQueryJson = {
      delimiters: ['%%', '%%'],
      template: "{$smarty.capture.template|escape:'javascript':'UTF-8'}",
      props: ['displayName', 'configKey', 'description'],
      mounted: function () {
        this.$nextTick(function () {
          var self = this;
          var editor = ace.edit('ace' + this.configKey);
          editor.setTheme('ace/theme/xcode');
          editor.getSession().setMode('ace/mode/javascript');
          editor.setOptions({
            fontSize: 14,
            minLines: 20,
            maxLines: 100,
            showPrintMargin: true
          });
          editor.on('change', function () {
            self.$store.commit('setConfig', {
              key: self.configKey,
              value: editor.getValue()
            });
          });
          // Disable error checking
          editor.getSession().setUseWorker(false);
        });
      },
      computed: {
        queryJson: function () {
          return this.$store.state.config[this.configKey];
        }
      }
    };
  }());
</script>
