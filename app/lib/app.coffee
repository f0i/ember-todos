require "vendor/jquery-1.7.1"
require "vendor/ember-0.9.5"
require "templates/main_view"

root = exports ? this
root.Todos = Ember.Application.create()

Todos.Todo = Ember.Object.extend(
  title: null
  isDone: false
)

Todos.todosController = Ember.ArrayController.create(
  content: []
  createTodo: (title) ->
    todo = Todos.Todo.create(title: title)
    @pushObject todo

  clearCompletedTodos: ->
    @filterProperty("isDone", true).forEach @removeObject, this

  remaining: (->
    @filterProperty("isDone", false).get "length"
  ).property("@each.isDone")
  isEmpty: (->
    @get("length") is 0
  ).property("length")
  allAreDone: ((key, value) ->
    if arguments.length is 2
      @setEach "isDone", value
      value
    else
      not @get("isEmpty") and @everyProperty("isDone", true)
  ).property("@each.isDone")
)

Todos.CreateTodoView = Ember.TextField.extend(insertNewline: ->
  value = @get("value")
  if value
    Todos.todosController.createTodo value
    @set "value", ""
)

Todos.MainView = Ember.View.extend(templateName: "main_view")
