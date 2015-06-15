-------------------------------------------------------------------------------
-- Localized Lua globals.
-------------------------------------------------------------------------------
local _G = getfenv(0)

local pairs = _G.pairs

-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

-------------------------------------------------------------------------------
-- Objects.
-------------------------------------------------------------------------------
local Profession = {}
local ProfessionMetatable = {
    __index = Profession,
}

private.Professions = {}

-------------------------------------------------------------------------------
-- Profession Methods.
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Instantiation.
-------------------------------------------------------------------------------
function private.CreateProfessionFromModule(module)
    local moduleName = module:GetName()
    for localizedProfessionName, professionModuleName in pairs(private.PROFESSION_MODULE_NAMES) do
        if professionModuleName == moduleName then
            local profession = _G.setmetatable({
                _id = private.PROFESSION_IDS[localizedProfessionName],
                _localizedName = localizedProfessionName,
                _name = professionModuleName,
                _module = module,
                _recipeCount = 0,
            }, ProfessionMetatable)

            private.Professions[professionModuleName] = profession
            module.Profession = profession
            break;
        end
    end
end
