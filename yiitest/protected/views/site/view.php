<?php
$this->pageTitle=Yii::app()->name . ' - View data';
$this->breadcrumbs=[
    'View data of '.$viewName,
];
?>
<h3><?php echo $viewName?></h3>
<table>
    <thead>
        <tr>
            <?php foreach($columns as $key=>$val):?>
                <th><?php echo $val['Field']?></th>
            <?php endforeach?>
        </tr>
    </thead>
    <tbody>
        <?php foreach($data as $row):?>
            <tr>
                <?php foreach($row as $key=>$val):?>
                    <td><?php echo $val?></td>
                <?php endforeach?>
            </tr>
        <?php endforeach?>
    </tbody>
</table>