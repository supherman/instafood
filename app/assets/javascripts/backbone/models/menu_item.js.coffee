class Instafood.MenuItem extends Backbone.Model
  urlRoot: '/menu_items'

class Instafood.MenuItems extends Backbone.Collection
  url: '/menu_items'

  model: Instafood.MenuItem
