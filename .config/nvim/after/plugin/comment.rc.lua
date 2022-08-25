local status, comment = pcall(require, 'Comment')
if (not status) then
  return
end

print('loading comment')

comment.setup()
