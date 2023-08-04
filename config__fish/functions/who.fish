

function who -d "look up an IP" -a ip
  grep $ip $HOME/.local/share/gcp-audit/latest/public-ipmap.txt
  grep $ip $HOME/.local/share/gcp-audit/latest/nuclei.txt
end


