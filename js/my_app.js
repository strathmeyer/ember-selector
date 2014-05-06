// Generated by CoffeeScript 1.7.1
(function() {
  App.IndexRoute = Ember.Route.extend({
    model: function(params) {
      return {
        addresses: [
          {
            line1: 'foo',
            line2: 'quuux'
          }, {
            line1: 'bar',
            line2: 'qux'
          }
        ]
      };
    }
  });

  App.IndexController = Ember.ObjectController.extend({
    actions: {
      updateAddress: function(address) {
        return this.set('currentAddress', address);
      }
    }
  });

  App.AddressSelectView = Ember.View.extend({
    templateName: 'address-select',
    classNames: ['address-select']
  });

  App.AddressView = Ember.View.extend({
    templateName: 'address'
  });

}).call(this);