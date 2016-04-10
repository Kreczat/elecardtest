<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name;
$script = <<<EOT
  $(document).ready(function(){
      var autoUpdateFunction = function(){
           $.ajax({
                url: "index.php?r=site/list",
                success: function(data) {
                    $('#view-container').html(data);
               }
           });
      }
      autoUpdateFunction();
      setInterval(
            autoUpdateFunction,
            60000
      );
  });
EOT;
Yii::app()->clientScript->registerScript('script-autoupdate', $script);
Yii::app()->clientScript->registerCSSFile(Yii::app()->request->baseUrl . '/css/font-awesome.min.css');
?>
<h3>List of the Db Views</h3>
<div id="view-container"></div>
