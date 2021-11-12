<?php
use Elasticsearch\Client;

//if (!defined('_TB_VERSION_')) {
//    exit;
//}

/**
 * Class ElasticsearchproxyModuleFrontController
 *
 * Proxy class in order to proxy the frontend widget's calls to a private Elasticsearch server
 */
class ElasticsearchproxyModuleFrontController extends ModuleFrontController
{

    /** @var Elasticsearch $module */
    public $module;

    /** @var Client $client */
    protected $client;

    /**
     * It should just process the ajax call, then die
     *
     * @return void
     * @throws PrestaShopException
     */
    public function init()
    {

        if (Tools::isSubmit('submitElasticsearchSearch') && !empty(Tools::getValue('token')) && Tools::getValue('token') === sha1(_COOKIE_KEY_ . $this->module->name)) {
            // Set the content type and access control headers of the response
            header('Content-Type: application/json; charset=UTF-8');
            header('access-control-allow-headers: Access-Control-Allow-Headers,Origin,Accept,X-Requested-With,Content-Type,Access-Control-Request-Method,Access-Control-Request-Headers,Authorization');
            header('access-control-allow-methods:GET,HEAD,OPTIONS,POST,PUT');
            header('access-control-allow-origin: *');
            // Prepare the Elasticsearch client -- every action should be read
            $this->client = Elasticsearch::getClient();
            if (!$this->client) {
                die(json_encode([
                    'success' => false,
                    'messages' => ['Unable to initialize the Elasticsearch client'],
                ]));
            }
            // no need to use displayConf() here
            $action = 'elasticsearch';
            Hook::exec('actionAdmin' . ucfirst($action) . 'Before', ['controller' => $this]);
            Hook::exec('action' . get_class($this) . ucfirst($action) . 'Before', ['controller' => $this]);
            $return = $this->{'ajaxProcess' . Tools::toCamelCase($action)}();
            Hook::exec('actionAdmin' . ucfirst($action) . 'After', ['controller' => $this, 'return' => $return]);
            Hook::exec('action' . get_class($this) . ucfirst($action) . 'After', ['controller' => $this, 'return' => $return]);
            die(json_encode($return, JSON_UNESCAPED_SLASHES));
        }
        die(json_encode([
            'success' => false,
            'messages' => ['Missing token'],
        ]));
    }

    /**
     * Do a search
     *
     * Params:
     * - `query`
     *
     *
     * @return array Results or errors
     * @throws PrestaShopException
     */
    public function ajaxProcessElasticsearch()
    {
        $idShop = (int)Context::getContext()->shop->id;
        $idLang = (int)Context::getContext()->language->id;
        $request = [
            'index' => Configuration::get(Elasticsearch::INDEX_PREFIX) . "_{$idShop}_{$idLang}",
            'body' => json_decode(file_get_contents('php://input')),
        ];

        $searchQuery = Tools::getValue('search_query');

        $params = [
            'query' => [
                'multi_match' => [
                    'query' => (string)$searchQuery,
                    'type' => 'phrase_prefix',
                    'fields' => \ElasticsearchModule\Meta::getSearchableMetas(),
                ],
            ],
        ];

        $request['body'] = $params;

        try {
            $result= $this->client->search($request)['hits']['hits'];
        } catch (Exception $e) {
            $result= [];
        }
        $search_result=[];
        $products=$result;

        if(!empty($products)){
            foreach($products as $product)
            {
                $product_obj = new Product($product['_id'], null, (int)$this->context->language->id);
                if (!Validate::isLoadedObject($product_obj))
                    continue;

                $category_obj = new Category((int)$product_obj->id_category_default, (int)$this->context->language->id);
                $search_result[] = array(
                    'name' => $product['_source']['nameproperty'],
                    'uri' => $this->context->link->getProductLink($product_obj, null, $product_obj->category),
                    'category' => $category_obj->name
                );
            }
        }


        $this->context->smarty->assign('links', $search_result);
        return $this->context->smarty->fetch('module:elasticsearch/views/templates/front/searchInputResultsList.tpl');
    }
}
