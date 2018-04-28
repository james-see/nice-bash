# this code creates hello_world.rs and turns it into an executable an then runs it
# optionally it installs rust if you comment out the second line 'brew install rust'

#!/bin/bash
# optional step install homebrew first and install rust via brew
# brew install rust
# found and taken from here: https://joelmccracken.github.io/entries/a-simple-web-app-in-rust-pt-1/
echo 'fn main() {

        println!("hello world");
}' > hello_world.rs;
rustc hello_world.rs
./hello_world

