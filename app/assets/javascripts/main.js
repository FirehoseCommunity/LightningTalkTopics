// jQuery functions
$(function(){
  mobileNavigationToggle();
});

// Function to toggle open and closed mobile navigation menu
function mobileNavigationToggle() {
  $('#mobile-navigation-toggle').click(function() {
    $('.navigation-links-wrapper').slideToggle(300);
  });
}
