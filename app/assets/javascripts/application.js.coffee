//= require jquery
//= require jquery_ujs
//= require_tree .

$.fn.cardID = ->
  '.' + $(this).attr('class').match(/card_\d/)

$.fn.nextCard = ->
  next = $($(this).parent().cardID()).next()
  if next.length
    next
  else
    $('.fronts .card').first()

$.fn.showBack = ->
  $('.back').addClass('hide')
  $('.back' + $(this).cardID()).removeClass('hide')

$ ->
  $('.front').click ->
    $(this).showBack()
  $('.back .next').click ->
    $(this).nextCard().showBack()