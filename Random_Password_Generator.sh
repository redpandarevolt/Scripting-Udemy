#!/bin/bash

# Randomly generated passwords


#Password using random
PASSWORD =  "${RANDOM}"
echo "${PASSWORD}"


# Longer password using 3 x RANDOM
PASSWORD = "${RANDOM}${RANDOM}${RANDOM}"
echo "triple random: ${RANDOM}"

# Use the  current date/teim as the password
PASSWORD=$(date +%s)
echo "seconds pwd: ${PASSWORD}"


# Use the current date/time with %s%N for added nano sec
PASSWORD=$(date +%s%N)
echo "nano pswd:  ${PASSWORD}"


# A better password using date, checksum 
PASSWORD=$(date +%s%N | sha256sum | head -c32)
echo "Better pswd: ${PASSWORD}"

# Even Better Randomization
PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c48)
echo "Even better pswd: ${PASSWORD}"

# Adding Randomized Character Even Better Password
SPECIAL_CHAR=$(echo '!@#$%^&*()_+=' | fold -w1 |shuf| head -c1)
echo "Adding a special character: ${PASSWORD}${SPECIAL_CHAR}"

