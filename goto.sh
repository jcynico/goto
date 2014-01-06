goto() {
  string=''
  IFS='/ ' read -a array <<< `pwd`
  for element in "${array[@]}"; do
  string=$string/$element
  if [ "$1" == "$element" ]; then
    break
  fi
  done
  cd $string
}

# Tab completion for goto
function _goto {
  IFS='/ ' read -a array <<< `pwd`
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  COMPREPLY=( $(compgen -W "${array[*]}" -- ${cur}) )
  return 0
}
complete -F _goto goto
