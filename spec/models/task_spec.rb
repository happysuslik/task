require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'valid task' do
    it 'is valid if text and priority is correct' do
      task = Task.new(text: "Task1", priority: 0)
      expect(task.valid?).to eq(true)
    end

    it 'is invalid if text is incorrect' do
      task = Task.new(text: "", priority: 0)
      expect(task.valid?).to eq(false)
    end
  end

  describe 'methods' do
    it 'set priority' do
      project = create(:project)
      task = project.tasks.create(text: "Text 1")
      task2 = project.tasks.create(text: "Text 2")
      expect(task.priority).to eq(0)
      expect(task2.priority).to eq(1)
    end

    it 'update priority' do
      project = create(:project)
      task = project.tasks.create(text: "Text 1")
      task2 = project.tasks.create(text: "Text 2")
      task3 = project.tasks.create(text: "Text 3")
      task2.destroy
      expect(task.reload.priority).to eq(0)
      expect(task3.reload.priority).to eq(1)
    end
  end
end
