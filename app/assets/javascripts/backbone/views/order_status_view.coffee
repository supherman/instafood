class Instafood.OrderStatusView extends Instafood.InstafoodView
  el: '#order_status'

  initialize: ->
    @model.on('item_added', @refreshOrder, @)
    @model.on('change', @notifyChange, @)

  refreshOrder: ->
    @model.fetch()

  notifyChange: (order)->
    console.log order.toJSON()



