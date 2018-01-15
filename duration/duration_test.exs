ExUnit.start()

defmodule TestDurationFormatter do
  Code.require_file("./duration.ex")
  use ExUnit.Case

  test "format_duration" do
    assert DurationFormatter.format_duration(66748035) == "2 years, 42 days, 13 hours, 7 minutes and 15 seconds"
    # assert DurationFormatter.format_duration(66748035) == "1 year, 1 day, 1 hour, 1 minute and 1 second"
    assert DurationFormatter.format_duration(1) == "1 second"
    assert DurationFormatter.format_duration(62) == "1 minute and 2 seconds"
    assert DurationFormatter.format_duration(120) == "2 minutes"
    assert DurationFormatter.format_duration(3600) == "1 hour"
    assert DurationFormatter.format_duration(3662) == "1 hour, 1 minute and 2 seconds"
  end
end
