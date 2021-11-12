
<div class="form-group product-count">
  <p class="form-control-static">
    {l s='Showing' mod='elasticsearch'} %% _.min([offset + 1, total.value]) %% - %% _.min([page * limit, total.value]) %% {l s='of' mod='elasticsearch'} %% total.value %% <span v-if="parseInt(total.value, 10) === 1">{l s='item' mod='elasticsearch'}</span><span v-else>{l s='items' mod='elasticsearch'}</span>
  </p>
</div>
