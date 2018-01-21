defmodule Kprime do
    
    def count_Kprimes(k, start, nd) do
        find_primes(30)
    end

    def find_primes(upto) do
        2..upto
        |> Enum.into %{}, &({&1, true})
    end

    def puzzle(s) do
        # your code
    end
end
