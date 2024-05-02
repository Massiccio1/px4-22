# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto -i'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

export ROS_DOMAIN_ID=0


# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

alias gbrc="gedit $HOME/.bashrc && source $HOME/.bashrc && source $HOME/.bashrc"

alias s="source ~/.bashrc ; source /opt/ros/humble/setup.bash ; source ~/ros2_ws/install/setup.bash"

alias gitlog="git log --graph --decorate"

alias cdrw="cd ~/ros2_ws"
alias cdrws="cd ~/ros2_ws/src"
alias sim="cd ~/PX4-Autopilot && make px4_sitl gazebo-classic"
alias simw="cd ~/PX4-Autopilot && make px4_sitl gazebo-classic_windy"
alias simh="cd ~/PX4-Autopilot && HEADLESS=1 make px4_sitl gazebo-classic"
alias agent="cd ~/Micro-XRCE-DDS-Agent && MicroXRCEAgent udp4 -p 8888"
alias rtl="ros2 topic list"
alias r2launch="ros2 run offboard_controller offboard_controller"
alias r2path="ros2 launch px4_offboard visualize.launch.py"
alias r2path100="RVIZ_MAX_BUFFER=100 ros2 launch px4_offboard visualize.launch.py"
alias r2path1000="RVIZ_MAX_BUFFER=1000 ros2 launch px4_offboard visualize.launch.py"

alias p3gui="python3 ~/ros2_ws/src/px4-py/src/gui.py"
alias p3launch="python3 ~/ros2_ws/src/px4-py/src/px4-py.py"
alias p3hb="python3 ~/ros2_ws/src/px4-py/src/hb.py"
alias camera="ros2 launch realsense2_camera rs_launch.py depth_module.profile:=640x480x10 rgb_camera.profile:=640x480x10"
alias slam="cd ~/ros2_ws && ros2 run orbslam3 rgbd src/orbslam3_ros2/vocabulary/ORBvoc.txt src/orbslam3_ros2/config/rgb-d/TUM1.yaml"
alias r2all="sim & agent & r2path & /bin/python3 /home/massimo/ros2_ws/src/px4-py/src/px4-py.py"

alias opti="TRACKED_ROBOT_ID=44 ros2 run optitrack_interface optitrack"
alias opti20="TRACKED_ROBOT_ID=20 ros2 run optitrack_interface optitrack"
alias slam="ros2 run orbslam3 rgbd src/orbslam3_ros2/vocabulary/ORBvoc.txt src/orbslam3_ros2/config/rgb-d/TUM1.yaml"

alias sshr4c="ssh rock@rock-4c-plus.local"
alias sshr4c2="ssh rock@192.168.1.43"


alias p3opti-to.px4="python3 ~/ros2_ws/src/px4-py/src/opti-to-px4.py"

alias code="code --disable-gpu"
alias ccbsi="cd ~/ros2_ws && colcon build --symlink-install"


alias dockerstart="sudo systemctl start docker.socket && sudo systemctl start docker.service"
alias dockerstop="sudo systemctl stop docker.socket && sudo systemctl stop docker.service"
alias debian="docker run -d -p 6901:6901 -p 5901:5901 -v $PWD:/shared:ro piopirahl/docker-desktop:1.0.2 && echo http://localhost:6901/"
alias alpine="docker run -d  -e GROUP_ID=1000 -e USER_ID=1000 -e TZ=Europe/Rome --cap-add SYS_ADMIN --shm-size 2g -p 5801:5800 shokinn/docker-alpine-desktop:latest && echo http://localhost:5800"

alias l='ll'
alias gs='git status'
alias gl='git log --graph --all'
alias rm='rm -vR'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'



export LD_LIBRARY_PATH=~/Pangolin/build/src/:~/ORB_SLAM3/Thirdparty/DBoW2/lib:~/ORB_SLAM3/Thirdparty/g2o/lib:~/ORB_SLAM3/lib:$LD_LIBRARY_PATH

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.



if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

case ":${PATH}:" in
    *:"$HOME/.cargo/bin":*)
        ;;
    *)
        # Prepending path in case a system-installed rustc needs to be overridden
        export PATH="$HOME/.cargo/bin:$PATH"
        ;;
esac



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion