DEFINE C_NET_ADDR 0x6001
DEFINE C_NET_DATA 0x01
DEFINE C_NET_SYNC 0x02
DEFINE C_STACK_BOTTOM_ADDR 0x1FF

DEFINE V_STACK_TOP_ADDR 0x100
DEFINE V_WRITE_ADDR 0x101
DEFINE V_IMG_WORD 0x102
DEFINE V_BIT_MASK 0x103
DEFINE V_PREV_NET_SYNC 0x104
DEFINE V_NET_DATA 0x105

# Init net `sync` state
A = C_NET_ADDR
D = *A
A = C_NET_SYNC
D = D & A
A = V_PREV_NET_SYNC
*A = D

# Init stack
A = C_STACK_BOTTOM_ADDR
D = A
A = V_STACK_TOP_ADDR
*A = D

# Init image write address
A = 0x4000
D = A
A = V_WRITE_ADDR
*A = D

LABEL L_IMAGE_WORD_LOOP

# Call F_RECEIVE_BIT to receive the control bit
A = L_001
D = A
A = V_STACK_TOP_ADDR
*A = *A + 1
A = *A
*A = D
A = F_RECEIVE_BIT
JMP

LABEL L_001

# End if no more data
A = V_NET_DATA
D = *A
A = L_END
D ; JEQ

# Init for receiving a word
A = V_IMG_WORD
*A = 0
A = V_BIT_MASK
*A = 1

# Loop to receive 16 bits
LABEL L_RECEIVE_BIT_LOOP

# Call F_RECEIVE_BIT to receive a single bit
A = L_002
D = A
A = V_STACK_TOP_ADDR
*A = *A + 1
A = *A
*A = D
A = F_RECEIVE_BIT
JMP

LABEL L_002

# Skip if data is `0`
A = V_NET_DATA
D = *A
A = L_AFTER_BIT
D ; JEQ

# Merge the received bit into the word
A = V_BIT_MASK
D = *A
A = V_IMG_WORD
*A = D | *A

LABEL L_AFTER_BIT

# Shift the bit mask left
A = V_BIT_MASK
D = *A
D = D + *A
*A = D

# Check if we have received 16 bits
A = L_RECEIVE_BIT_LOOP
D ; JNE

# Write the received word to the image
A = V_IMG_WORD
D = *A
A = V_WRITE_ADDR
A = *A
*A = D

# Increment the write address
A = 0x20
D = A
A = V_WRITE_ADDR
*A = D + *A

A = L_IMAGE_WORD_LOOP
JMP


# Function
# Receives a single bit from net
LABEL F_RECEIVE_BIT

# Wait for next bit
LABEL L_WAIT_NET_DATA
A = C_NET_ADDR
D = *A
A = C_NET_SYNC
D = D & A
A = V_PREV_NET_SYNC
D = D ^ *A
A = L_WAIT_NET_DATA
D ; JEQ

# Store the current net `sync`
LABEL F_STORE_NET_SYNC
A = C_NET_ADDR
D = *A
A = C_NET_SYNC
D = D & A
A = V_PREV_NET_SYNC
*A = D

# Store the current net data
A = C_NET_ADDR
D = *A
A = C_NET_DATA
D = D & A
A = V_NET_DATA
*A = D

# Return
A = V_STACK_TOP_ADDR
A = *A
D = *A
A = V_STACK_TOP_ADDR
*A = *A - 1
A = D
JMP


LABEL L_END
