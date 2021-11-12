
<div class="form-group">
  <label class="control-label col-lg-3">
    <span :class="description ? 'label-tooltip' : ''"
          :data-toggle="description ? 'tooltip' : ''"
          :data-html="description ? 'true' : ''"
          :title="description"
          :data-original-title="description"
    >
      %% displayName %%
    </span>
  </label>
  <div class="table-responsive col-lg-9">
    <table class="table overflow-y">
      <thead>
        <tr>
          <th></th>
          <th>{l s='Read' mod='elasticsearch'}</th>
          <th>{l s='Write' mod='elasticsearch'}</th>
          <th>{l s='URL' mod='elasticsearch'}</th>
          <th></th>
        </tr>
      </thead>
      <tfoot style="background-color: #ecf6fb">
        <tr class="filter">
          <td class="filter"
              style="font-weight: 700; border-top: 1px solid #a0d0eb; border-bottom: 1px solid #a0d0eb;">{l s='Add server' mod='elasticsearch'}</td>
          <td style="border-top: 1px solid #a0d0eb; border-bottom: 1px solid #a0d0eb;">
            <a href="#" v-if="serverDraft.read" class="list-action-enable action-enabled" @click="toggleDraftRead">
              <i class="icon icon-check"></i>
            </a>
            <a href="#" v-if="!serverDraft.read" class="list-action-enable action-disabled" @click="toggleDraftRead">
              <i class="icon icon-times"></i>
            </a>
          </td>
          <td style="border-top: 1px solid #a0d0eb; border-bottom: 1px solid #a0d0eb;">
            <a href="#" v-if="serverDraft.write || proxied" class="list-action-enable action-enabled" @click="toggleDraftWrite">
              <i class="icon icon-check"></i>
            </a>
            <a href="#" v-if="!serverDraft.write && !proxied" class="list-action-enable action-disabled" @click="toggleDraftWrite">
              <i class="icon icon-times"></i>
            </a>
          </td>
          <td style="border-top: 1px solid #a0d0eb; border-bottom: 1px solid #a0d0eb;">
            <input type="text" @keyup="updateDraftUrl($event)" :value="serverDraft.url">
          </td>
          <td class="filter" style="border-top: 1px solid #a0d0eb; border-bottom: 1px solid #a0d0eb;">
            <button type="submit" class="btn btn-default" @click="addServer">
              <i class="icon icon-plus"></i> {l s='Add' mod='elasticsearch'}
            </button>
          </td>
        </tr>
      </tfoot>
      <tbody>
        <tr v-for="(server, index) in servers" :class="index % 2 ? 'odd' : ''">
          <td>Server %% index + 1 %%</td>
          <td>
            <a href="#"
               class="list-action-enable action-enabled"
               v-if="server.read || proxied"
               @click="toggleRead(server, $event)"
               :disabled="proxied"
            ><i class="icon icon-check"></i>
            </a>
            <a href="#"
               v-if="!server.read && !proxied"
               class="list-action-enable action-disabled"
               @click="toggleRead(server, $event)"
               :disabled="proxied"
            >
              <i class="icon icon-times"></i>
            </a>
          </td>
          <td>
            <a href="#"
               v-if="server.write || proxied"
               class="list-action-enable action-enabled"
               @click="toggleWrite(server, $event)"
               :disabled="proxied"
            >
              <i class="icon icon-check"></i>
            </a>
            <a href="#"
               v-if="!server.write && !proxied"
               class="list-action-enable action-disabled"
               @click="toggleWrite(server, $event)"
               :disabled="proxied"
            >
              <i class="icon icon-times"></i>
            </a>
          </td>
          <td>
            <input type="text" :value="server.url" @keyup="updateUrl(server, $event)">
          </td>
          <td>
            <button type="submit" class="btn btn-default" @click="deleteServer(server, $event)"><i
                      class="icon icon-trash"></i> {l s='Delete' mod='elasticsearch'}</button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
