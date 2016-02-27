require 'rails_helper'

RSpec.describe Project, type: :model do

  describe 'title validation' do
    it 'is valid if title is correct' do
      project = Project.new(title: "Project")
      expect(project.valid?).to eq(true)
    end

    it 'is invalid if title is correct' do
      project = Project.new(title: "")
      expect(project.valid?).to eq(false)
    end

  end
end