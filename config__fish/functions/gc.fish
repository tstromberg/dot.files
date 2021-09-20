# Defined via `source`
function gc --wraps=git --description 'alias gc=git c'
  git c $argv; 
end
