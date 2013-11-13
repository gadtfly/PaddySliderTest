#= require jquery
#= require jquery_ujs
#= require_tree .

# Evaluate to `f` if current selection is empty
$.fn.orElse = (f) ->
  if $(this).length
    $(this)
  else
    f()



# Selects all elements with same `card_#{n}` as container of matched elements
$.fn.card = ->
  c = $(this).closest('.card').attr('class').match(/card_\d/)
  $('.' + c)



# Next card's front (cycling to last card front)
$.fn.nextCard = ->
  $(this).card().next('.front').orElse(firstCard)
firstCard = ->
  $('.card.front').first()

# Prev card's front (cycling to first card front)
$.fn.prevCard = ->
  $(this).card().prev('.front').orElse(lastCard)
lastCard = ->
  $('.card.front').last()



# Show back of clicked card, hiding all other backs
showBack = ->
  $('.back').addClass('hide')
  $(this).card().removeClass('hide')
showNext = ->
  $(this).nextCard().trigger('click')
showPrev = ->
  $(this).prevCard().trigger('click')



# Main
$ ->
  $('.card.front').click(showBack)
  $('.next').click(showNext)
  $('.prev').click(showPrev)