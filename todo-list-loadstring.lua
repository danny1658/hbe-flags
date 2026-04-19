local todo_list_content = game:HttpGet('https://raw.githubusercontent.com/danny1658/hbe-flags/main/todo-list.lua')

local function loadTodoList()
    return loadstring(todo_list_content)()
end

return loadTodoList