init.stack
push.value 0
if.goto end
# this line should be execued
push.value 1
if.goto end
# this line should not be executed:
push.value x17
label end: