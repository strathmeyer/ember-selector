window.App = Ember.Application.create
  LOG_TRANSITIONS: true

App.Router.map ->
  @.route "about", { path: "/about" }
  @.route "favorites", { path: "/favs" }

App.IndexRoute = Ember.Route.extend
  model: (params)->
    {
      addresses: [
        {line1: 'foo', line2: 'quuux'}
        {line1: 'bar', line2: 'qux'}
      ]
    }

App.IndexController = Ember.ObjectController.extend
  actions:
    updateAddress: (address)->
      @.set('currentAddress', address)

App.AddressSelectView = Ember.View.extend
  templateName: 'address-select'
  classNames: ['address-select']

App.AddressView = Ember.View.extend
  templateName: 'address'


################### Selector #####################

App.SelectorListComponent = Ember.Component.extend
  currentIndex: 0

  currentModel: (->
    @.get('models')[@.get('currentIndex')]
  ).property('currentIndex', 'models')

  indexDidChange: (->
    @.sendAction('indexUpdate', @.get('currentIndex'))
    @.sendAction('modelUpdate', @.get('currentModel'))
  ).observes('currentIndex').on('init')


App.SelectorListItemComponent = Ember.Component.extend
  classNameBindings: ['selected']
  classNames: ['selector-item']

  selected: (->
    @.get('list.currentIndex') == @.get('index')
  ).property('list.currentIndex')
  click: ->
    @.get('list').set('currentIndex', @.get('index'))


