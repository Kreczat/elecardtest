<?php
$this->breadcrumbs=array(
    'Db View List',
);
foreach($viewList as $viewName):?>
    <a href="/index.php?r=site/edit&name=<?php echo $viewName;?>" title="Edit"><span class="fa fa-edit"></span></a>&nbsp;<a href="/index.php?r=site/view&name=<?php echo $viewName;?>"><?php echo $viewName;?></a><br/>
<?php endforeach;
