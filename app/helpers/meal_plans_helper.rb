require "zlib"

module MealPlansHelper
  MEAL_PLAN_CATEGORY_GRADS = %w[grad2 grad3 grad4 grad5 grad6].freeze

  # Stable pick so the same category name always maps to the same gradient asset.
  def meal_plan_category_gradient_basename(category)
    key = category.respond_to?(:name) ? category.name.to_s : category.to_s
    MEAL_PLAN_CATEGORY_GRADS[Zlib.crc32(key) % MEAL_PLAN_CATEGORY_GRADS.size]
  end
end
