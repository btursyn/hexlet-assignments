# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  def setup; end

  def teardown; end

  # BEGIN
  def test_stack_should_be_empty
    stack = Stack.new
    assert { stack.to_a.empty? == true }
  end

  def test_stack_adding_element
    push_element = 10
    stack = Stack.new
    stack.push! push_element
    assert {stack.to_a[0] == push_element}
  end

  def test_stack_remove_element
    push_element = 10
    stack = Stack.new
    stack.push! push_element
    stack.pop!
    assert {stack.to_a.empty? == true}
  end

  def test_stack_clear_all
    stack = Stack.new
    stack.push! 10
    stack.push! 20
    stack.push! 30
    stack.push! 40
    stack.clear!
    assert {stack.to_a.empty? == true}
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
