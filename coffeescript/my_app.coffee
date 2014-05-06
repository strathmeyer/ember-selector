# Routes

App.IndexRoute = Ember.Route.extend
  model: (params)->
    addresses: [
      {line1: 'foo', line2: 'quuux'}
      {line1: 'bar', line2: 'qux'}
    ]

# Controllers

App.IndexController = Ember.ObjectController.extend
  actions:
    updateAddress: (address)->
      @.set('currentAddress', address)

# Views

App.AddressSelectView = Ember.View.extend
  templateName: 'address-select'
  classNames: ['address-select']

App.AddressView = Ember.View.extend
  templateName: 'address'
