# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
collectedData = ->
  contacts = $(".googleContacts ul li")
  array= []
  $.each(contacts, (index) ->
    full_name = $(this).text()
    array[index] = full_name
    console.log("contact", $(this).text()))
  return array

choosenPage = ->
  $('#pages').on('change', ->
    value = $(this).val()
    alert(value)
  )

$(document).ready ->
  choosenPage()
  data = collectedData()
  $(".googleContacts ul").html('')
  for fullName in data
    $(".googleContacts ul").append('
      <li>'+fullName+'</li>')
