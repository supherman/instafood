class Instafood.OrderStatusView extends Instafood.InstafoodView
  el: '.cart'

  template: HandlebarsTemplates['backbone/templates/order_status']

  initialize: ->
    @model.on('item_added', @refreshOrder, @)
    @model.on('change', @notifyChange, @)

  render: (order)->
    @$el.html(@template({ quantity: order.get('total_unique_items'), total: order.get('total') }))

  refreshOrder: ->
    @model.fetch()

  notifyChange: (order)->
    @render(order)



