<?php
// use craft\config\GeneralConfig;
use craft\helpers\App;

return [
    'showLabel' => true,
    'labelText' => App::env('CRAFT_ENVIRONMENT'),
    'prefixText' => null,
    'suffixText' => null,
    'labelColor' => '#cc5643',
    'textColor' => '#ffffff',
    'targetSelector' => '#global-header:before',
];

?>