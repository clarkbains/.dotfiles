# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
#zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'r:|[._-,]=** r:|=**' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
#zstyle ':completion:*' original true
zstyle :compinstall filename '/home/cbains/.zshrc'
zstyle ':completion:*' menu select
autoload -Uz compinit
compinit
#autoload -U colors && colors
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob
setopt HIST_IGNORE_DUPS
unsetopt beep
# End of lines configured by zsh-newuser-install
#SYNTAX="/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
#SUGGEST="/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
#[ -f "$SYNTAX" ] && source "$SYNTAX"
#[ -f "$SUGGEST" ] && source "$SUGGEST"
plugins=(
  #zsh-syntax-highlighting
  zsh-autosuggestions
)
 

# Include fzf on main machine
#KEYBIND="/usr/share/fzf/key-bindings.zsh"
#COMPLETION="/usr/share/fzf/completion.zsh"
#[ -f "$KEYBIND" ] && source "$KEYBIND"
#[ -f "$COMPLETION" ] && source "$COMPLETION"
 
# Customize FZF a bit to skip folders I don't care about, makes searching source faster
#export FZF_DEFAULT_COMMAND='rg --files --no-follow --glob "!.svn/*" --glob "!.git/*" --glob "!third-party/*" -tc -tcpp -tpy'
 
# Better autosuggestions
export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)
 
# This is to do completions async (can be set to anything)
export ZSH_AUTOSUGGEST_USE_ASYNC="True"
#with this config
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.pdf=00;32:*.ps=00;32:*.txt=00;32:*.patch=00;32:*.diff=00;32:*.log=00;32:*.tex=00;32:*.doc=00;32:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36"

setopt AUTO_PUSHD
setopt prompt_subst
setopt PRINT_EXIT_VALUE
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}


#source $HOME/.config/zsh/zsh-git-prompt/zshrc.sh
PROMPT='%F{blue}%n%F{yellow}@%F{green}%m %F{yellow}%25<..<%~%<< %F{white}%f'
#PROMPT='%B%m%~%b$(git_super_status) %# '
ZSH_THEME_GIT_PROMPT_UNTRACKED=""
ZSH_THEME_GIT_PROMPT_SUFFIX="] "
ZSH_THEME_GIT_PROMPT_CACHE=1
repo_info_with_check() {
    if [ $1 = "UNTRACKED" ]; then
      return
    fi
    if repo_check $1; then
        add_theme_var $1
        add_repo_var $1
        add_color_reset
    fi
}

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

alias ls="ls --color=auto"
alias ll="ls -l"
alias l.="ls -la"
alias la="la -la"
alias dc="docker-compose "
alias logs="docker-compose logs"
alias up="docker-compose up -d"
alias upf="docker-compose up"
alias gcm="git commit -m "
alias gcms="git commit -sS -m "
alias gs="git status"
alias gp="git push"
alias ga="git add"

function rpcp {
	file_path=`realpath -z $@`
	echo $file_path
	echo $file_path | xclip -selection clipboard
}

alias "yay -R"="yay -sR"
alias "vsh"="vagrant ssh"
alias "vls"="vagrant global-status"
alias "v"="vagrant"
catp() {
  if [[ $# -lt 1 ]]; then
    echo "Provide a Path"
    return
  fi
  echo `which $1`
  cat `which $1`
}

autoload -U +X bashcompinit && bashcompinit
load-resources() {
  autoload -X
}

if [ -f $HOME/.zsh_env.sh ]; then
	source $HOME/.zsh_env.sh
fi
