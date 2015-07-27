$(document).ready(function() {
  console.log( "ready!" );

  // Show login modal
  $(".login-modal").click(function() {
    event.preventDefault();
    $("#login-overlay").addClass("visible");
  });

  // Show signup modal
  $(".signup-modal").click(function(event) {
    event.preventDefault();
    $("#signup-overlay").addClass("visible");
  });

  // Hide login/signup modal when clicking exit icon
  $(".exit-modal-icon").click(function() {
    $("#login-overlay, #signup-overlay").removeClass("visible");
  });

  // Hide login/signup modal when clicking esc key
  $(document).keyup(function(event) {
    if (event.keyCode === 27) {
      $("#login-overlay, #signup-overlay").removeClass("visible");
    }
  });

  // Hide login modal when clicking outside modal window
  $("#login-overlay").click(function(event) {
    if ($(event.target).closest("#login-overlay-div").length === 0) {
      $("#login-overlay").removeClass("visible");
    }
  });

  // Hide signup modal when clicking outside modal window
  $("#signup-overlay").click(function(event) {
    if ($(event.target).closest("#signup-overlay-div").length === 0) {
      $("#signup-overlay").removeClass("visible");
    }
  });

  // Show or hide edit form when clicked
  $(".resources-list").on("click", ".edit-resource-btn", function(event) {
    event.preventDefault();
    $(this).hide()
           .prev()
           .show()
           .closest(".resource-item")
           .addClass("edit-mode");
  });

  // Show or hide mobile navigation
  $("#nav-icon").click(function() {
    $(".mobile-nav").slideToggle();
    $(this).toggleClass("open");
  });

  // Fade out flash after a few seconds
  if ( $("#flash-container").length ) {
    $("#flash-container").fadeIn("slow")
                         .delay(2500)
                         .fadeOut("slow");
  }

  // Submit form when clicking on checkbox
  $(".resources-list").on("click", ".resource-item input[type='checkbox']", function() {
    $(this).closest("form").submit();
  });
});
