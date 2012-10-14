class Instafood.OrderItem extends Backbone.Model
  urlRoot: '/order/order_items'

class Instafood.OrderItems extends Backbone.Collection
  url: '/order/order_items'
