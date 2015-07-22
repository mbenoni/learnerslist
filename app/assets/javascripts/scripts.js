$( document ).ready(function() {
  console.log( "ready!" );

  // Show login modal
  $(".login-modal").click(function() {
    $("#login-overlay").addClass("visible");
  });

  // Show signup modal
  $(".signup-modal").click(function() {
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


  // Add class to parent element and change text when clicked
  $('.resource-item input[type="checkbox"]').click(function() {
    var $parent    = $(this).closest(".resource-item");
    var $labelText = $(this).next();

    if ($parent.hasClass("completed")) {
      $parent.removeClass("completed");
      $labelText.text("Completed?");
    } else {
      $parent.addClass("completed");
      $labelText.text("Completed");
    }
  });

  // Show or hide edit form when clicked
  $(".edit-resource").click(function(event) {
    event.preventDefault();
    if ($(this).closest(".resource-item").hasClass("edit-mode")) {
      $(this).closest(".resource-item").removeClass("edit-mode");
      $(this).text("Edit");
    } else {
      $(this).closest(".resource-item").addClass("edit-mode");
      $(this).text("Done editing");
    }
  });


  // Confirm deleting a resource
  $(".delete-resource").click(function(evt) {
    evt.preventDefault();
    swal({   
      title: "Are you sure?",      
      type: "warning",   
      showCancelButton: true,   
      confirmButtonColor: "#DD6B55",   
      confirmButtonText: "Yes, delete it!"
    });
  });

  // Show or hide mobile navigation
  $("#nav-icon").click(function() {
    $(".mobile-nav").slideToggle();
    $(this).toggleClass("open");
  });
});