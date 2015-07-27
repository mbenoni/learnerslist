# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  if $(".pagination").length
    $(window).scroll ->
      more_resources_url = $('.pagination .next_page').attr('href')
      if more_resources_url && $(window).scrollTop() > $(document).height() - $(window).height() - 215
        $(".pagination").text("Loading more resources...")
        $.getScript(more_resources_url)
    $(window).scroll()
