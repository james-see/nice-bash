# this code creates hello_world.rs and turns it into an executable an then runs it
# optionally it installs rust if you comment out the second line 'curl https://sh.rustup.rs -sSf | sh`
'

#!/bin/bash
# optional step install rust via rustup
# curl https://sh.rustup.rs -sSf | sh
# found and taken from here: https://joelmccracken.github.io/entries/a-simple-web-app-in-rust-pt-1/
echo 'fn main() {

        println!("hello world");
}' > hello_world.rs;
rustc hello_world.rs
./hello_world

