<?php  echo head(array('title' => metadata('item', array('Dublin Core', 'Title')),'bodyclass' => 'items show')); ?>
<div id="primary">
    <h1>

     <?php   echo metadata('item', array('Dublin Core','Title')); ?></h1> 
     
<!-- Copy of files from below -->
	<?php if(metadata('item','has files')): ?>
    <h3><?php echo __('Files'); ?></h3>
    <div id="item-images">
         <?php echo files_for_item(); ?>
    </div>
    <?php endif;?>
    

 <!-- Items metadata -->
    <div id="item-metadata"> 
   
       <?php if (metadata('item', array('Item Type Metadata', 'Description'))): ?>

 <h3>	 <?php echo 'Description' ?>  </h3>   
     <?php echo metadata('item', array('Item Type Metadata', 'Description')); ?>  

   <?php endif;?>

    <?php if (metadata('item', array('Item Type Metadata', 'Rarity'))): ?>

 <h3>	 <?php echo 'Rarity' ?>  </h3>   
     <?php echo metadata('item', array('Item Type Metadata', 'Rarity')); ?>  
   <?php endif;?>

    <?php if (metadata('item', array('Item Type Metadata', 'Sense of the Modern'))): ?>

 <h3>	 <?php echo 'Sense of the Modern' ?>  </h3>   
     <?php echo metadata('item', array('Item Type Metadata', 'Sense of the Modern')); ?>  
   <?php endif;?>


    <?php if (metadata('item', array('Item Type Metadata', 'Source'))): ?>

 <h3>	 <?php echo 'Source' ?>  </h3>   
     <?php echo metadata('item', array('Item Type Metadata', 'Source')); ?>  
   <?php endif;?>
  
 <?php #if (metadata('item', array('Item Type Metadata', 'User'))): ?>

 <h3>    <?php #echo 'User' ?>  </h3>
     <?php #echo metadata('item', array('Item Type Metadata', 'User')); ?>
   <?php #endif;?> 
   

    </div>
    <!-- Comments out file images here. 
    <?php if(metadata('item','has files')): ?>
    <h3><?php echo __('Files'); ?></h3>
    <div id="item-images"> 
         <?php echo files_for_item(); ?>
    </div>
    <?php endif;?>
-->
     <!-- The following prints a list of all tags associated with the item -->
    <?php if (metadata('item','has tags')): ?>
    <div id="item-tags" class="element">
        <h3><?php echo __('Tags'); ?></h3>
        <div class="element-text"><?php echo tag_string('item'); ?></div>
    </div>
    <?php endif;?>

    <!-- The following prints a citation for this item. 
    Commenting out citation info
    <div id="item-citation" class="element">
        <h3><?php echo __('Citation'); ?></h3>
        <div class="element-text"><?php echo metadata('item','citation',array('no_escape'=>true)); ?></div>
    </div>
       <?php fire_plugin_hook('public_items_show', array('view' => $this, 'item' => $item)); ?>
    -->

    <ul class="item-pagination navigation">
        <li id="previous-item" class="previous"><?php echo link_to_previous_item_show(); ?></li>
        <li id="next-item" class="next"><?php echo link_to_next_item_show(); ?></li>
    </ul>

</div> <!-- End of Primary. -->

 <?php echo foot(); ?>
