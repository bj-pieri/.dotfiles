local present, impatient = pcall(require, "impatient")

if present then
   impatient.enable_profile()
end

local core_modules = {
   "core.utils",
   "core.options",
   "core.autocmds",
   "core.mappings",
   "core.colorscheme"
}

for _, module in ipairs(core_modules) do
   local ok, err = pcall(require, module)
   if not ok then
      error("Error loading " .. module .. "\n\n" .. err)
   end
end
