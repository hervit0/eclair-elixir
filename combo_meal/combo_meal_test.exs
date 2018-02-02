ExUnit.start()

defmodule TestComboMeal do
  Code.require_file("./combo_meal.ex")
  use ExUnit.Case

  # How to inject IO during tests?
  # Unecessary complexity to me, not so much real world apps are using IO nowadays

  test "combo_meal" do
  end
end
