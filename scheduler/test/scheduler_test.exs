defmodule SchedulerTest do
  use ExUnit.Case

  import Mock

  setup_all do
    scheduler = Process.whereis(Scheduler.Scheduler)
    {:ok, %{scheduler: scheduler}}
  end

  describe "when app starts" do
    test "then Scheduler process is alive", %{scheduler: scheduler} do
      assert is_pid(scheduler)
    end
  end

  # Not suitable
  # describe "when Scheduler is alive" do
  #   test "then it calls Foo.hit_frequently" do
  #     with_mock Scheduler.Foo, hit_frequently: fn -> :ok end do
  #       :timer.sleep(70000)
  #       IO.inspect(DateTime.utc_now())
  #       assert called(Scheduler.Foo.hit_frequently())
  #     end
  #   end
  # end

  describe "when Scheduler is alive and has one shot" do
    test "then it calls Foo.hit_once" do
      with_mock Scheduler.Foo, hit_frequently: fn -> :ok end do
        with_mock DateTime, utc_now: fn -> travel_time(2) end do
          IO.inspect(DateTime.utc_now())
          assert called(Scheduler.Foo.hit_frequently())
        end
      end
    end
  end

  defp travel_time(seconds) do
    {:ok, mock_date} =
      DateTime.utc_now()
      |> DateTime.to_naive()
      |> NaiveDateTime.add(seconds)
      |> DateTime.from_naive("Etc/UTC")

    mock_date
  end
end
