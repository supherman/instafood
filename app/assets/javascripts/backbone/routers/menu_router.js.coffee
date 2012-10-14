class Instafood.MenuRouter extends Backbone.Router
  routes:
    ':id' : 'addToOrder'

  addToOrder: (id)->
    $.ajax
      url: '/auth_check'
      type: 'GET'
      success: ->
        menu_item = new Instafood.MenuItem({ id: id })
        menu_item.fetch()
        new Instafood.MenuItemView({ model: menu_item })
      error: ->
        $('#modal-login').modal()
