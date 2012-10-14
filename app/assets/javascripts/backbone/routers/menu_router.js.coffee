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
        if Instafood.order is undefined
          Instafood.order = new Instafood.Order()
          Instafood.order.fetch()
      error: ->
        $('#modal-login').modal()
