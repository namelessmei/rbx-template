local tbench = require("@tbench")

local function factorial(n: number): number
    if n <= 1 then 
		return 1 
	end
    return n * factorial(n - 1)
end

local bench = tbench.BENCHMARK_F("MathBench", "Operations")
bench.CASE("Factorial(5)", function()
    factorial(5)
end)

bench.CASE("Factorial(10)", function()
    factorial(10)
end)

tbench.RUN_ALL_BENCHMARKS()
