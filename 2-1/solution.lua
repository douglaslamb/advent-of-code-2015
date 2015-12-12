paperNeeded = function (l, w, h) 
  local amt = 0
  local lw = l * w
  local wh = w * h
  local hl = h * l
  amt = 2 * lw + 2 * wh + 2 * hl + math.min(lw, wh, hl)
  return amt
end

split = function(inString)
  local outTable = {}
  for word in string.gmatch(inString, "%x+") do
    table.insert(outTable, word)
  end
  return outTable
end

local totalPaper = 0

for line in io.lines("input") do
  local table = split(line)
  totalPaper = totalPaper + paperNeeded(table[1], table[2], table[3])
end

print(totalPaper .. " square feet is how much paper the elves need.")
