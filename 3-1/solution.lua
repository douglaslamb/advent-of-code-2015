local f = assert(io.open("input", "r"))
local t = f:read("*all")
local floor = 0

local houseArray = {}
x = 1
y = 1

luckys = 0

if houseArray[y] == nil then
  houseArray[y] = {}
end
if houseArray[y][x] == nil then
  houseArray[y][x] = 1
else
  houseArray[y][x] = houseArray[y][x] + 1
end

for i = 1, string.len(t) do
  local tempChar = string.sub(t, i, i)
  if tempChar == "^" then
    y = y - 1
  elseif tempChar == "v" then
    y = y + 1
  elseif tempChar == "<" then
    x = x - 1
  elseif tempChar == ">" then
    x = x + 1
  end
  if houseArray[y] == nil then
    houseArray[y] = {}
  end
  if houseArray[y][x] == nil then
    houseArray[y][x] = 1
  else
    houseArray[y][x] = houseArray[y][x] + 1
  end
end

--had to use "pairs" here insead of "ipairs" bc
--ipairs iterates starting from 1 so it doesn't
--work if you have negative indices

for i, v in pairs(houseArray) do
  for j, u in pairs(houseArray[i]) do
    if u > 0 then
      luckys = luckys + 1
    end
  end
end

print(luckys .. " houses got at least one present.")
