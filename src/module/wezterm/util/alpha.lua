local function alpha(hexadecimal, opacity)
	hexadecimal = hexadecimal:gsub('#', '')

	return 'rgba('
		.. tonumber('0x' .. hexadecimal:sub(1, 2))
		.. ','
		.. tonumber('0x' .. hexadecimal:sub(3, 4))
		.. ','
		.. tonumber('0x' .. hexadecimal:sub(5, 6))
		.. ','
		.. opacity
		.. ')'
end

return alpha
