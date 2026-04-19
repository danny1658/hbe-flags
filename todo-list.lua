local HttpService = game:GetService("HttpService")

-- User data storage with localStorage functionality
local DataStoreService = game:GetService("DataStoreService")
local playerData = DataStoreService:GetDataStore("PlayerData")

-- Function to set player data in the local storage
local function setPlayerData(player, key, value)
    local success, err = pcall(function()
        playerData:SetAsync(player.UserId, { [key] = value })
    end)
    if not success then
        warn("Failed to set data: " .. err)
    end
end

-- Function to get player data from the local storage
local function getPlayerData(player, key)
    local success, data = pcall(function()
        return playerData:GetAsync(player.UserId)
    end)
    if success and data then
        return data[key]
    else
        warn("Failed to get data: " .. (data or "no data"))
        return nil
    end
end

-- To-do List Application
local todoList = {}

-- Function to add a new task
function addTask(task)
    table.insert(todoList, task)
    setPlayerData(game.Players.LocalPlayer, "todoList", todoList)
end

-- Function to remove a task
function removeTask(index)
    table.remove(todoList, index)
    setPlayerData(game.Players.LocalPlayer, "todoList", todoList)
end

-- Function to load to-do list from local storage at the beginning
local function loadTodoList()
    local savedTasks = getPlayerData(game.Players.LocalPlayer, "todoList")
    if savedTasks then
        todoList = savedTasks
    end
end
loadTodoList()

-- Example Usage
addTask("Finish the prototype")
addTask("Publish the game") -- Add your tasks here!

print("Current To-do List:")
for index, task in ipairs(todoList) do
    print(index .. ". " .. task)
end

-- To use this module, just require it in your game scripts.