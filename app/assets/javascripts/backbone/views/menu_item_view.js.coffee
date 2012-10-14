class Instafood.MenuItemView extends Instafood.InstafoodView
  el: '#modal-base'

  events:
    'click .close' : 'closeModal'

  template: HandlebarsTemplates['backbone/templates/menu_item']

  initialize: ->
    @model.on('change', @render, @)
    @model.fetch()

  render: ->
    @$el.html(@template(@model.toJSON()))
    @$el.modal()

  closeModal: (e)->
    Instafood.menu_router.navigate('#')
