printf '1. Checking for Homebrew: '
# Start the spinner in the background.
# The background job's PID is stored in special variable `$!`.
tput civis # Hide cursor.
trap 'tput cnorm' EXIT
(while :; do for c in / - \\ \|; do printf '%s\b' "$c"; sleep 0; done; done) &
homebrewstatus="not installed"

# Run the synchronous (blocking) command.
# In this example we simply sleep for a few seconds.
sleep 3
if which brew > /dev/null 2>&1;then
 homebrewstatus="Homebrew installed!"
 else
   homebrewstatus="Homebrew not installed, come back when it is!"
   exit 1
fi 
# The blocking command has finished:
# Print a newline and kill the spinner job.
{ echo -e "\r\033[K$homebrewstatus"; kill $! && wait $!; } 2>/dev/null

tput cnorm # Show cursor again
echo 'Done.'


