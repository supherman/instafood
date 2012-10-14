class Instafood.MenuRouter extends Backbone.Router
  routes:
    ':id' : 'addToOrder'

  addToOrder: (id)->
    if Instafood.order?
      menu_item = new Instafood.MenuItem({ id: id })
      menu_item.fetch()
      new Instafood.MenuItemView({ model: menu_item })
    else
      $('#modal-login').modal()
