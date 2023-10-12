local status, whichKeys = pcall(require, 'which-key')
if (not status) then return end

whichKeys.setup()
