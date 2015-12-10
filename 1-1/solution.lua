local f = assert(io.open("input", "r"))
local t = f:read("*all")
local floor = 0

for i = 1, string.len(t) do
  tempChar = string.sub(t, i, i)
  if tempChar == "(" then
    floor = floor + 1
  elseif tempChar == ")" then
    floor = floor - 1
  end
end

print("Santa is on floor " .. floor .. ".")
