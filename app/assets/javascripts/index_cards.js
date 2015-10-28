$(document).ready(function() {

  var windowResizeID,
      $windowWidth = $(window).width(),
      $iceIndex = $('.ice-index'),
      $alignBottom = $('.align-bottom');

  // Return largest height of '.ice-index' elements
  function largestCardHeight() {
    var largestHeight = 0;

    $iceIndex.each(function() {
      if ($(this).height() > largestHeight) {
        largestHeight = $(this).height();
      }
    });

    return largestHeight;
  }

  // Set all '.ice-index' elements to largest height
  function heightToLargest() {
    var largestHeight = largestCardHeight();

    $iceIndex.each(function() {
      $(this).height(largestHeight);
    });
  }

  // Set all '.ice-index' elements to largest height with animation
  function heightToLargestAnimated() {
    var largestHeight = largestCardHeight();

    $iceIndex.each(function() {
      $(this).animate({
        height: largestHeight
      }, 300);
    });
  }

  // Set all '.ice-index' elements to auto
  function heightToAuto() {
    $iceIndex.each(function() {
      $(this).height('auto');
    });
  }

  // Set style rules for '.align-bottom' elements
  // to vertically align to bottom of their parent
  function setAlignBottomStyles() {
    $alignBottom.each(function() {
      $(this).parent().css('position', 'relative');
      $(this).css('position', 'absolute');
      $(this).css('bottom', '1%');
      $(this).css('width', '100%');
    });
  }

  // CSS properties affected from calling setAlignBottomStyles()
  // are set to default value
  function removeAlignBottomStyles() {
    $alignBottom.each(function() {
      $(this).parent().css('position', 'static');
      $(this).css('position', 'static');
      $(this).css('bottom', 'auto');
      $(this).css('width', 'auto');
    });
  }

  // Readjust cards' size when browser width changes
  $(window).on('resize', function() {
    // if check to cover for mobile devices
    if ($windowWidth !== $(document).width()) {
      heightToAuto();
      removeAlignBottomStyles();

      clearTimeout(windowResizeID);
      windowResizeID = setTimeout(function() {
        heightToLargestAnimated();
        setAlignBottomStyles();
      }, 700);
    }
  });

  // Readjust cards' size when mobile orientation changes
  $(window).on('orientationchange', function() {
    $windowWidth = $(window).width();
    heightToAuto();
    removeAlignBottomStyles();

    clearTimeout(windowResizeID);
    windowResizeID = setTimeout(function() {
      heightToLargestAnimated();
      setAlignBottomStyles();
    }, 1000);
  });

  heightToLargest();
  setAlignBottomStyles();

});