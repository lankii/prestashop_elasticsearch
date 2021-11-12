
<div class="form-group clearfix">
  <ul class="pagination" style="cursor: pointer">
    <li :disabled="page == 1"
        :class="(page == 1) ? 'disabled ' : '' + 'pagination_previous'"
        title="{l s='First' mod='elasticsearch'}"
    >
      <a @click="setPage(1)" style="padding-top: 4px">
        <span class="icon icon-angle-double-left"></span>
      </a>
    </li>
    <li :disabled="page == 1"
        :class="(page == 1) ? 'disabled ' : '' + 'pagination_previous'"
        title="{l s='Previous' mod='elasticsearch'}"
    >
      <a v-if="page != 1" @click="setPage(page - 1)" style="padding-top: 4px">
        <span class="icon icon-angle-left"></span>
      </a>
      <span v-else @click="setPage(page - 1)" style="padding-top: 4px">
        <span class="icon icon-angle-left"></span>
      </span>
    </li>
    <li v-for="numberToShow in numbersToShow" :class="(page == numberToShow) ? 'active current' : ''">
      <a v-if="page != numberToShow" @click="setPage(numberToShow)">
        <span>%% numberToShow %%</span>
      </a>
      <span v-else @click="setPage(numberToShow)">
        <span>%% numberToShow %%</span>
      </span>
    </li>
    <li :disabled="page == nbPages" :class="(page == nbPages) ? 'disabled' : '' + 'pagination_next'" title="Next">
      <a v-if="page != nbPages" rel="next" @click="setPage(page + 1)" style="padding-top: 4px">
        <span class="icon icon-angle-right"></span>
      </a>
      <span v-else rel="next" @click="setPage(page + 1)" style="padding-top: 4px">
        <span class="icon icon-angle-right"></span>
      </span>
    </li>
    <li :disabled="page == nbPages" :class="(page == nbPages) ? 'disabled' : '' + 'pagination_next'" title="Next">
      <a v-if="page != nbPages" rel="next" @click="setPage(nbPages)" style="padding-top: 4px">
        <span class="icon icon-angle-double-right"></span>
      </a>
      <span v-else rel="next" @click="setPage(nbPages)" style="padding-top: 4px">
        <span class="icon icon-angle-double-right"></span>
      </span>
    </li>
  </ul>
</div>
