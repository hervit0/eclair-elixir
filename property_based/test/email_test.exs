defmodule EmailTest do
  use ExUnit.Case
  require ExUnitProperties

  domains = [
    "gmail.com",
    "hotmail.com",
    "yahoo.com",
  ]

  email_generator =
    ExUnitProperties.gen all name <- StreamData.string(:alphanumeric),
                             name != "",
                             domain <- StreamData.member_of(domains) do
      name <> "@" <> domain
    end

  email_max_length = 20
  number_emails = 5
  emails = Enum.take(StreamData.resize(email_generator, email_max_length), number_emails)
  IO.inspect(emails)
end
