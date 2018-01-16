# Run startup script, first fix display
echo "Running startup script"
# Uncomment to rotate display left 
#xrandr --output DVI-D-1 --right-of DVI-I-1 --auto --rotate left

# Running this provides that we have password on our ssh key
## Highly recommended for security reasons
SSH_ENV="$HOME/.ssh/environment"

start_agent ()
{
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# Start some programs

dropbox start &
ulauncher --hide-window &
xscreensaver 
