To install on linux-gnu or darwin:

    source <(curl -s https://raw.githubusercontent.com/dkourilov/env/raw/master/autoinstall.sh)

To test installation:

    dest=$(mktemp -d); \
    cd ${dest}; \
    echo Installing to ${dest}...; \
    source <(curl -s https://raw.githubusercontent.com/dkourilov/env/raw/master/autoinstall.sh);

Or to test local checkout:

    mkdir /tmp/home1
    dest=/tmp/home1 ./install.sh


