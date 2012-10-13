class Instafood.InstafoodView extends Backbone.View

  auth: false

  initialize: ->
    @setAuth()

  setAuth: ->
    $.getJSON '/auth_check', =>
      @auth = true
