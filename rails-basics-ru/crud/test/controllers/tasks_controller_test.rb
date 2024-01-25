require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_attributes = {
      name: Faker::Artist.name,
      description: Faker::Movies::HarryPotter.quote,
      status: Faker::Movies::HarryPotter.spell,
      creator: Faker::Movies::HarryPotter.character,
      performer: Faker::Movies::HarryPotter.character,
      completed: Faker::Boolean.boolean
    }

    @task_attributes_new = {
      name: Faker::Artist.name,
      description: Faker::Movies::HarryPotter.quote,
      status: Faker::Movies::HarryPotter.spell,
      creator: Faker::Movies::HarryPotter.character,
      performer: Faker::Movies::HarryPotter.character,
      completed: Faker::Boolean.boolean
    }

    @task = tasks(:one)
  end

  test 'should get index' do
    get tasks_path
    assert_response :success
  end

  test 'should get show' do
    get task_path(@task.id)
    assert_response :success
  end

  test 'should get new' do
    get new_task_path()
    assert_response :success
  end

  test 'should create task' do
    assert_difference("Task.count") do
      post tasks_path, params: { task: @task_attributes_new }
    end
  
    assert_redirected_to task_path(Task.last)
  end

  test 'should get edit' do
    get edit_task_path(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_path(@task), params: { task: @task_attributes }
  
    assert_redirected_to task_path(@task)
  end

  test 'should delete task' do
    delete task_path(@task)

    assert_redirected_to tasks_path
  end
end
