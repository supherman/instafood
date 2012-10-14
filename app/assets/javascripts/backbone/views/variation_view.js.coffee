class Instafood.VariationsView extends Instafood.InstafoodView
  el: '#variations'

  template: HandlebarsTemplates['backbone/templates/menu_item_variation']

  initialize: ->
    @render()

  render: ->
    @addAll()

  addAll: ->
    @collection.forEach(@addOne, @)

  addOne: (variation)->
    @$el.append(@template(variation))
