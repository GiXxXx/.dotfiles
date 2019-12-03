parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export GIT_EDITOR=vim

#Jason aliases
alias build='mvn clean package -T4 -DskipTests=true'
alias ll='ls -l'
