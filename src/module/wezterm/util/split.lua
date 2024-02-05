local function split(string, condition)
	if condition == nil then
		condition = '%s'
	end
	local t = {}
	for str in string.gmatch(string, '([^' .. condition .. ']+)') do
		table.insert(t, str)
	end
	return t
end

return split
