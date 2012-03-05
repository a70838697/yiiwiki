<?php
$this->breadcrumbs=array(
	'Entries'=>array('index'),
	$model->title,
);

$this->menu=array(
	array('label'=>'List Entry', 'url'=>array('index')),
	array('label'=>'Create Entry', 'url'=>array('create')),
	array('label'=>'Update Entry', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Entry', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Entry', 'url'=>array('admin')),
);
?>

<h1>View Entry #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'title',
		'content',
		'access',
		'user_id',
		'ip',
		'revision',
		'create_time',
		'update_time',
	),
)); ?>
