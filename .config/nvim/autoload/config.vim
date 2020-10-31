" Reload the configuration.
function! config#ReloadVIMRC()
    source $MYVIMRC
    AirlineRefresh
    echom "Reloaded " . $MYVIMRC
endfunction

