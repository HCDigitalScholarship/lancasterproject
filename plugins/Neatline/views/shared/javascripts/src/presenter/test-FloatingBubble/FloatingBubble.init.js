
/**
 * @package     omeka
 * @subpackage  neatline
 * @copyright   2014 Rector and Board of Visitors, University of Virginia
 * @license     http://www.apache.org/licenses/LICENSE-2.0.html
 */

Neatline.module('Presenter.FloatingBubble', function(FloatingBubble) {


  FloatingBubble.addInitializer(function() {
    FloatingBubble.__controller = new FloatingBubble.Controller();
  });


});
