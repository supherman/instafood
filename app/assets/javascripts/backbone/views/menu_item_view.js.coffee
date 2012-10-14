class Instafood.MenuItemView extends Instafood.InstafoodView
  el: '#modal-base'

  events:
    'click .btn-anadir'           : 'addToOrder'
    'click input[name=variation]' : 'addVariation'
    'keyup .input-cant'           : 'calculateSubTotal'
    'click .input-cant'           : 'focusQuantityText'

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
    if _.isEmpty @model.get('variations')
      @activateButton()
      @$el.find('#quantity').show()
      @$el.find('.costo-cal').html("Son $#{@model.get('price')} + a tu orden")

  selectedVariations: ->
    $('input[name=variation]:checked').siblings('input')

  addToOrder: (e)->
    e.preventDefault()
    return if @$el.find('.btn-anadir').hasClass('disabled')
    if _.isEmpty @model.get('variations')
      @createOrder(@model.get('id'), 'MenuItem', 1, @model.get('price'))
    else
      @createOrder $(variation).data('id'), 'Variation', $(variation).val(), $(variation).data('price') for variation in @selectedVariations()
    Instafood.order.trigger 'item_added'
    @$el.modal('hide')

  createOrder: (item_id, item_type, quantity, price)->
    order_item = new Instafood.OrderItem
      item_id   : item_id
      item_type : item_type
      quantity  : quantity
      price     : price
    Instafood.order_items.create order_item

  addVariation: (e)->
    if _.isEmpty(@selectedVariations())
      @deactivateButton()
    else
      @activateButton()
      @calculateSubTotal()

  activateButton: ->
    @$el.find('.btn-anadir').removeClass('disabled')

  deactivateButton: ->
    @$el.find('.btn-anadir').addClass('disabled')

  calculateSubTotal: ->
    if _.isEmpty @model.get('variations')
      subTotal = @model.get('price') * parseInt($('#quantity .input-cant').val())
    else if not _.isEmpty(@selectedVariations())
      subTotal = _.reduce @selectedVariations(), ((sum, variation)-> sum + $(variation).data('price') * parseInt($(variation).val())), 0
    @$el.find('.costo-cal').html("Son $#{subTotal} + a tu orden")

  focusQuantityText: (e)->
    $(e.target).select()
