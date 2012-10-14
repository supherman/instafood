class Instafood.MenuItemView extends Instafood.InstafoodView
  el: '#modal-base'

  events:
    'click .btn-anadir' : 'addToOrder'

  template: HandlebarsTemplates['backbone/templates/menu_item']

  initialize: ->
    @model.on('change', @render, @)
    @model.fetch()
    @$el.on 'hide', =>
      @undelegateEvents()
      Instafood.menu_router.navigate('#')

  render: ->
    @$el.html(@template(@model.toJSON()))
    new Instafood.VariationsView({ collection: @model.get('variations') })
    @$el.modal()

  addToOrder: (e)->
    e.preventDefault()
    if _.isEmpty @model.get('variations')
      order_item = new Instafood.OrderItem({ item_id: @model.get('id'), item_type: 'MenuItem', quantity: 1, price: @model.get('price') })
    else

