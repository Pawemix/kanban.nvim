local M = {}

function M.map(kanban, task)
	-- Task movement
	vim.keymap.set("n", "L", function()
		kanban.fn.tasks.take.right(kanban)
	end, { silent = true, buffer = task.buf_nr })
	vim.keymap.set("n", "H", function()
		kanban.fn.tasks.take.left(kanban)
	end, { silent = true, buffer = task.buf_nr })

	-- Navigatiion task
	vim.keymap.set("n", "<C-j>", function()
		kanban.fn.tasks.move.down(kanban)
	end, { silent = true, buffer = task.buf_nr })
	vim.keymap.set("n", "<C-k>", function()
		kanban.fn.tasks.move.up(kanban)
	end, { silent = true, buffer = task.buf_nr })
	vim.keymap.set("n", "<C-l>", function()
		kanban.fn.tasks.move.right(kanban)
	end, { silent = true, buffer = task.buf_nr })
	vim.keymap.set("n", "<C-h>", function()
		kanban.fn.tasks.move.left(kanban)
	end, { silent = true, buffer = task.buf_nr })
	vim.keymap.set("n", "gg", function()
		kanban.fn.tasks.move.top(kanban, task)
	end, { silent = true, buffer = task.buf_nr })
	vim.keymap.set("n", "G", function()
		kanban.fn.tasks.move.bottom(kanban, task)
	end, { silent = true, buffer = task.buf_nr })

	-- delete task
	vim.keymap.set("n", "D", function()
		kanban.fn.tasks.delete(kanban, task)
	end, { silent = true, buffer = task.buf_nr })

	-- create task
	vim.keymap.set("n", "o", function()
		kanban.fn.tasks.add(kanban, nil, nil, "bottom", true)
	end, { silent = true, buffer = task.buf_nr })
	vim.keymap.set("n", "O", function()
		kanban.fn.tasks.add(kanban, nil, nil, "top", true)
	end, { silent = true, buffer = task.buf_nr })

	-- close window
	vim.keymap.set("n", ":q<cr>", function()
		kanban.fn.kwindow.close(kanban)
		kanban.fn.lists.close_all(kanban)
		kanban.fn.tasks.close_all(kanban)
	end, { silent = true, buffer = task.buf_nr })
	vim.keymap.set("n", "q", function()
		kanban.fn.kwindow.close(kanban)
		kanban.fn.lists.close_all(kanban)
		kanban.fn.tasks.close_all(kanban)
	end, { silent = true, buffer = task.buf_nr })

	-- edit task
	-- vim.keymap.set("i", "<er>", function()
	-- 	kanban.fn.tasks.take.right(kanban)
	-- end, { silent = true, buffer = task.buf_nr })
	--
	-- delete
	vim.keymap.set("n", "<C-o>", "k", { silent = true, buffer = task.buf_nr })

end

return M
