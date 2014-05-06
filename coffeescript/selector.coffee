################### Selector #####################

App.SelectorListComponent = Ember.Component.extend
  currentIndex: 0

  currentModel: (->
    @.get('models')[@.get('currentIndex')]
  ).property('currentIndex')

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
