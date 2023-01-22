
export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles:
for file in ~/.{path,bash_prompt,exports,aliases,functions,bash_local}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


complete -C /usr/local/bin/terraform terraform
