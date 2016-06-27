To install on linux-gnu or darwin:

    source <(curl -s https://raw.githubusercontent.com/dkourilov/env/master/autoinstall.sh)

To test installation:

    dest=$(mktemp -d); \
    cd ${dest}; \
    echo Installing to ${dest}...; \
    source <(curl -s https://raw.githubusercontent.com/dkourilov/env/master/autoinstall.sh);

Or to test local checkout:

    mkdir /tmp/home1
    dest=/tmp/home1 ./install.sh

Notes:

    Mainly optimized for Iterm2/OSX.

    Switching between buffers in Vim is made using <Shift>+<Control>+<Arrow> combination,
    remapped to <Esc>[65;5u in Iterm2 key mappings.

    Switching between tabs in tmux is done with <Control>+<Arrow>, 
    remapping to <Right Alt>+<Arrow> is possible with karabiner.

    Vim extensions require PowerLine-enabled font.
