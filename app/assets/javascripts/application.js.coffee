//= require jquery
//= require jquery_ujs
//= require_tree .

$.fn.card = ->
  c = $(this).closest('.card').attr('class').match(/card_\d/)
  $('.' + c)

$.fn.nextCard = ->
  next = $(this).card().next()
  if next.length
    next
  else
    $('.card.front').first()

$.fn.prevCard = ->
  prev = $(this).card().prev()
  if prev.length
    prev
  else
    $('.card.front').last()

showBack = ->
  $('.back').addClass('hide')
  $(this).card().removeClass('hide')
showNext = ->
  $(this).nextCard().trigger('click')
showPrev = ->
  $(this).prevCard().trigger('click')

$ ->
  $('.card.front').click(showBack)
  $('.next').click(showNext)
  $('.prev').click(showPrev)