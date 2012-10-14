class Instafood.MenuItemView extends Instafood.InstafoodView
  el: '#modal-base'

  events:
    'click .btn-anadir'           : 'addToOrder'
    'click input[name=variation]' : 'setButtonState'

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
    @activateButton() if _.isEmpty @model.get('variations')

  selectedVariations: ->
    $('input[name=variation]:checked').siblings('input')

  addToOrder: (e)->
    e.preventDefault()
    return if @$el.find('.btn-anadir').hasClass('disabled')
    if _.isEmpty @model.get('variations')
      @createOrder(@model.get('id'), 'MenuItem', 1, @model.get('price'))
    else
      @createOrder $(variation).data('id'), 'Variation', $(variation).val(), $(variation).data('price') for variation in @selectedVariations()
    @$el.modal('hide')

  createOrder: (item_id, item_type, quantity, price)->
    order_item = new Instafood.OrderItem
      item_id   : item_id
      item_type : item_type
      quantity  : quantity
      price     : price
    Instafood.order_items.create order_item

  setButtonState: (e)->
    if _.isEmpty(@selectedVariations())
      @deactivateButton()
    else
      @activateButton()

  activateButton: ->
    @$el.find('.btn-anadir').removeClass('disabled')

  deactivateButton: ->
    @$el.find('.btn-anadir').addClass('disabled')
