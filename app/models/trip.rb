class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :trail
  has_many :tasks
  has_one :review, dependent: :destroy

  validates :date, presence: true
  validate :must_be_after

  def must_be_after
    return if date > Time.now

    errors.add(:date, "must be in the future!")
  end

  def create_checklist(user)
    # mapping
    categories_to_tasks = { 'Muddy paths' => ['Wear water-resistant shoes'],
                            'Many mosquitoes' => ['Bring insect repellent', 'Wear long pants and long sleeves'],
                            'Uneven paths' => ['Wear proper hiking boots'],
                            'Monkey sightings' => ['Keep any food securely in your bag'] }
    # retrieve top 3 categories
    top_3_categories = self.trail.categories
    # for each of top 3 categories, add relevant items to checklist
    top_3_categories.each do |category|
      if categories_to_tasks.key?(category.name)
        categories_to_tasks[category.name].each { |task| Task.create!(user: user, trip: self, description: task) }
      end
    end
  end
end
