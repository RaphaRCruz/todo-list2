class TaskReflex < ApplicationReflex
  def mark_complete
    task = Task.find(element.dataset.id)
    task.update(done: true)
  end

  def mark_incomplete
    task = Task.find(element.dataset.id)
    task.update(done: false)
  end
end
