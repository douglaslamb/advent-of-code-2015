paperNeeded = function (l, w, h) 
  local amt = 0
  local lw = l * w
  local wh = w * h
  local hl = h * l
  amt = 2 * lw + 2 * wh + 2 * hl + math.min(lw, wh, hl)
  return amt
end

getPerimeter = function (l, w)
  return 2 * l + 2 * w
end

getVolume = function (l, w, h)
  return l * w * h
end

ribbonNeeded = function(l, w, h)
  local amt = 0
  lw = getPerimeter(l, w)
  wh = getPerimeter(w, h)
  hl = getPerimeter(h, l)
  return math.min(lw, wh, hl) + getVolume(l, w, h)
end

split = function(inString)
  local outTable = {}
  for word in string.gmatch(inString, "%x+") do
    table.insert(outTable, word)
  end
  return outTable
end

local totalRibbon = 0

for line in io.lines("input") do
  local table = split(line)
  totalRibbon = totalRibbon + ribbonNeeded(table[1], table[2], table[3])
end

print(totalRibbon .. " feet is how much ribbon the elves need.")
