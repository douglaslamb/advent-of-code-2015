local f = assert(io.open("input", "r"))
local t = f:read("*all")
local floor = 0

local houseArray = {}
santaLoc = {1, 1}
roboLoc = {1, 1}

luckys = 0
count = 0

if houseArray[1] == nil then
  houseArray[1] = {}
end
if houseArray[1][1] == nil then
  houseArray[1][1] = 1
else
  houseArray[1][1] = houseArray[1][1] + 1
end

for i = 1, string.len(t) do
  local tempChar = string.sub(t, i, i)
  local moverLoc = {}
  if count % 2 == 0 then
    moverLoc = santaLoc
  else
    moverLoc = roboLoc
  end
  if tempChar == "^" then
    moverLoc[2] = moverLoc[2] - 1
  elseif tempChar == "v" then
    moverLoc[2] = moverLoc[2] + 1
  elseif tempChar == "<" then
    moverLoc[1] = moverLoc[1] - 1
  elseif tempChar == ">" then
    moverLoc[1] = moverLoc[1] + 1
  end
  x = moverLoc[1]
  y = moverLoc[2]
  if houseArray[y] == nil then
    houseArray[y] = {}
  end
  if houseArray[y][x] == nil then
    houseArray[y][x] = 1
  else
    houseArray[y][x] = houseArray[y][x] + 1
  end
  count = count + 1
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

print(luckys .. " houses got at least one present via Robo and Normal Santa.")
