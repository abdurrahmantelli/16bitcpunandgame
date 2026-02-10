init.stack
push.value x42
goto end
# this line should not be executed:
push.value x17
label end:
# top of stack should be x42
