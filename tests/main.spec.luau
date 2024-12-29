local tbench = require("@tbench")

local function add(a: number, b: number): number
    return a + b
end

local function factorial(n: number): number
    if n <= 1 then return 1 end
    return n * factorial(n - 1)
end

tbench.TEST_F("MathTest", "Addition")(function()
    tbench.ASSERT_EQ(add(2, 2), 4)
    tbench.ASSERT_EQ(add(-1, 1), 0)
    tbench.ASSERT_EQ(add(0, 0), 0)
end)

tbench.TEST_F("MathTest", "Factorial")(function()
    tbench.ASSERT_EQ(factorial(0), 1)
    tbench.ASSERT_EQ(factorial(1), 1)
    tbench.ASSERT_EQ(factorial(5), 120)
end)

tbench.RUN_ALL_TESTS()