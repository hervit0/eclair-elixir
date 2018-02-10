ExUnit.start()

defmodule TestAcidNaming do
  Code.require_file("./acid_naming.ex")
  use ExUnit.Case

  # How to inject IO during tests?
  # Unecessary complexity to me, not so much real world apps are using IO nowadays

  test "acid_naming" do
    assert AcidNaming.acid_classify("hydrochloric") == "non-metal acid"
    assert AcidNaming.acid_classify("rainbowic") == "polyatomic acid"
    assert AcidNaming.acid_classify("idontevenknow") == "not an acid"
  end
end
