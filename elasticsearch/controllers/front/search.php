<?php
if (!defined('_TB_VERSION_')) {
    exit;
}

/**
 * Class ElasticsearchsearchModuleFrontController
 */
class ElasticsearchsearchModuleFrontController extends ModuleFrontController
{
    /** @var bool Place a column on the left by default, regardless of the store's default settings */
    public $display_column_left = true;

    /**
     * Initialize content
     * @throws PrestaShopException
     */
    public function initContent()
    {
        $this->addCSS(
            [
                _THEME_CSS_DIR_.'scenes.css'       => 'all',
                _THEME_CSS_DIR_.'category.css'     => 'all',
                _THEME_CSS_DIR_.'product_list.css' => 'all',
            ]
        );

        $this->setTemplate('search.tpl');

        parent::initContent();
    }
}
