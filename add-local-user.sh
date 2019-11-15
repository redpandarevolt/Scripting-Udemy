

!#/bin/bash

# Scenario: Linux System Admin Automate User Account Creation
# Creates a username and password on local users host
# make sure script executed with superuser (root) privileges
if [[ "${UID}" -ne 0 ]]
then
        echo 'Please run with sudo or as root'
        exit 1
fi

# Get username (login)
read -p 'Enter your username: ' USERNAME


# Get real name
read -p 'Enter your first and last name: ' REALNAME


# Get password
read -p 'Enter a password: ' PASSWORD


# Create the user with the password
useradd -c "${REALNAME}" -m${USERNAME}


# Check to see if the user add command succeeded
# ${?} exit status of last command
if [[ "${?}" -ne 0 ]]
then
        echo 'The account could not be created.'
        exit 1
fi
echo "Your username is ${USERNAME}"

#Force password change on first login
passwd -e ${USERNAME}

#Display the username, password and the host where the user was created
echo
echo 'username'
echo "${USERNAME}"
echo
echo 'password'
echo "${PASSWORD}"
echo
echo 'Host'
echo "${HOSTNAME}"
exit 0 
