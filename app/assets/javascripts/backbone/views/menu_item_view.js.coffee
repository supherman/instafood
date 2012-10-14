class Instafood.MenuItemView extends Instafood.InstafoodView
  el: '#modal-base'

  events:
    'click .close'      : 'closeModal'
    'click .btn-anadir' : 'addToOrder'

  template: HandlebarsTemplates['backbone/templates/menu_item']

  initialize: ->
    @model.on('change', @render, @)
    @model.fetch()

  render: ->
    @$el.html(@template(@model.toJSON()))
    new Instafood.VariationsView({ collection: @model.get('variations') })
    @$el.modal()

  closeModal: (e)->
    Instafood.menu_router.navigate('#')

  addToOrder: (e)->
    e.preventDefault()

