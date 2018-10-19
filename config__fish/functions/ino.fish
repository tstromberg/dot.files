function ino -d "inode watcher" -a path
  set command $argv[2..-1]
  echo "Watching $path for changes ..."
  while true
    sleep 0.1
    eval $command
    inotifywait -q -r -e modify -e create -e delete -e delete_self -e moved_to -e moved_from $path
  end
end
