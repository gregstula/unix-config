#!/bin/env lua

function clean(junk)
	local rm_rf_junk = string.format("rm -rf %s", junk)
	print("Executing: " .. rm_rf_junk)
	os.execute(rm_rf_junk)
end

local home = os.getenv("HOME") .. "/"
local nvim_junk = {
	home .. ".local/share/nvim",
	home .. ".local/state/nvim",
	home .. ".cache/nvim",
	home .. ".config/nvim",
}

for _, junk in ipairs(nvim_junk) do
	clean(junk)
end

print("󰿞  All clean  󰿞 ")
