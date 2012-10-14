class Instafood.MenuRouter extends Backbone.Router
  routes:
    ':id/add' : 'addToOrder'

  addToOrder: (id)->
    $.ajax
      url: '/auth_check'
      type: 'GET'
      success: ->
        $('#modal-base').modal()
      error: ->
        $('#modal-login').modal()
