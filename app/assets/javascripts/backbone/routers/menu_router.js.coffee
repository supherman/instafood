class Instafood.MenuRouter extends Backbone.Router
  routes:
    ':id/add' : 'addToOrder'

  addToOrder: (id)->
    $.ajax
      url: '/auth_check'
      type: 'GET'
      success: ->
        console.log 'add to order'
      error: ->
        $('#modal-login').modal()
        console.log 'sign in'
