let macro_mode_enabled = false;

let toggle_macro_mode = () => {
    if (macro_mode_enabled) {
        macro_mode_enabled = false;
        alert("Macro Mode Disabled");
    } else {
        macro_mode_enabled = true;
        alert("Macro Mode Enabled");
    }
}

let global_keydown_handler = (event) => {
    if (event.key === 'Escape') {
        toggle_macro_mode();       
    }
}

document.addEventListener("keydown", global_keydown_handler);