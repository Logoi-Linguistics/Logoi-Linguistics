if (window.innerWidth < 500) {
    alert("The Logoi editor has not yet been optimized for mobile. You are thanked for your understanding.")
}

let ACTIVE_PANE = "left";
let ACTIVE_CELL = "2-1";

// Editor (Input)

let editor = document.getElementById("editor");

let hook = document.createElement("input");
hook.setAttribute("id", "hook");
editor.appendChild(hook);

let halves = ["left", "right"];

for (let i = 0; i <= 1; i++) {
    let pane_div = document.createElement("div");
    pane_div.setAttribute("id", halves[i]);
    pane_div.classList.add("pane");
    pane_div.classList.add("half");
    editor.appendChild(pane_div);
}

let editor_rows = 200;
let editor_columns = 100;

let ide = document.createElement("table");
let ide_body = document.createElement("tbody");

for (let r = 0; r < editor_rows; r++) {
    let row = document.createElement("tr");
    for (let c = 0; c < editor_columns; c++) {
        let column = document.createElement("td");
        if (c == 0) {
            column.classList.add("gutter");
            column.appendChild(document.createTextNode(String(r)));
        } else {
            column.classList.add("character");
            column.appendChild(document.createTextNode("λ"));
        }
        column.setAttribute("id", String(r).concat("-", String(c)));
        row.appendChild(column);
    }
    ide_body.appendChild(row);
}

ide.appendChild(ide_body);
document.getElementById("left").appendChild(ide);

document.getElementById("0-1").innerHTML = "%";
document.getElementById("0-2").innerHTML = "&nbsp;";
document.getElementById("0-3").innerHTML = "E";
document.getElementById("0-4").innerHTML = "n";
document.getElementById("0-5").innerHTML = "g";
document.getElementById("0-6").innerHTML = "l";
document.getElementById("0-7").innerHTML = "i";
document.getElementById("0-8").innerHTML = "s";
document.getElementById("0-9").innerHTML = "h";
document.getElementById("0-10").innerHTML = ".";

document.getElementById("0-1").classList.add("function");
document.getElementById("0-3").classList.add("variable");
document.getElementById("0-4").classList.add("variable");
document.getElementById("0-5").classList.add("variable");
document.getElementById("0-6").classList.add("variable");
document.getElementById("0-7").classList.add("variable");
document.getElementById("0-8").classList.add("variable");
document.getElementById("0-9").classList.add("variable");
document.getElementById("0-10").classList.add("constant");

let editor_keydown = (event) => {
    console.table("KeyCode:", event.keyCode);
    
    let current_row = parseInt(ACTIVE_CELL.substring(0, ACTIVE_CELL.indexOf("-")));
    let current_col = parseInt(ACTIVE_CELL.substring(ACTIVE_CELL.indexOf("-") + 1));
    
    if (event.keyCode == 37) {
        // Left arrow event
        if (current_col <= 1) {
            let next_row = Math.max(0, current_row - 1);
            document.getElementById(ACTIVE_CELL).classList.remove("current-character");
            document.getElementById(String(current_row).concat("-", "0")).classList.remove("active-row");
            ACTIVE_CELL = String(next_row).concat("-", "1");
            document.getElementById(ACTIVE_CELL).classList.add("current-character");
            document.getElementById(String(next_row).concat("-", "0")).classList.add("active-row");
        } else {
            let next_col = Math.max(1, current_col - 1);
            document.getElementById(ACTIVE_CELL).classList.remove("current-character");
            ACTIVE_CELL = String(current_row).concat("-", String(next_col));
            document.getElementById(ACTIVE_CELL).classList.add("current-character");
        }
    }

    if (event.keyCode == 38) {
        // Up arrow event
        if (current_row > 0) {
            let next_row = Math.max(0, current_row - 1);
            document.getElementById(ACTIVE_CELL).classList.remove("current-character");
            document.getElementById(String(current_row).concat("-", "0")).classList.remove("active-row");
            ACTIVE_CELL = String(next_row).concat("-", current_col);
            document.getElementById(ACTIVE_CELL).classList.add("current-character");
            document.getElementById(String(next_row).concat("-", "0")).classList.add("active-row");
        }
    }

    if (event.keyCode == 39) {
        // Right arrow event
        if (current_col > 99) {
            let next_row = current_row + 1;
            document.getElementById(ACTIVE_CELL).classList.remove("current-character");
            document.getElementById(String(current_row).concat("-", "0")).classList.remove("active-row");
            ACTIVE_CELL = String(next_row).concat("-", "1");
            document.getElementById(ACTIVE_CELL).classList.add("current-character");
            document.getElementById(String(next_row).concat("-", "0")).classList.add("active-row");
        } else {
            let next_col = current_col + 1;
            document.getElementById(ACTIVE_CELL).classList.remove("current-character");
            ACTIVE_CELL = String(current_row).concat("-", String(next_col));
            document.getElementById(ACTIVE_CELL).classList.add("current-character");
        }
    }

    if (event.keyCode == 40) {
        // Down arrow event
        if (current_row < 199) {
            let next_row = current_row + 1;
            document.getElementById(ACTIVE_CELL).classList.remove("current-character");
            document.getElementById(String(current_row).concat("-", "0")).classList.remove("active-row");
            ACTIVE_CELL = String(next_row).concat("-", current_col);
            document.getElementById(ACTIVE_CELL).classList.add("current-character");
            document.getElementById(String(next_row).concat("-", "0")).classList.add("active-row");
        }
    }

    if (event.keyCode >= 65 && event.keyCode <= 90) {
        // Lowercase letter event
        document.getElementById(ACTIVE_CELL).innerHTML = String.fromCharCode(event.keyCode);
        // Move cursor to next cell
        let next_col = current_col + 1;
        document.getElementById(ACTIVE_CELL).classList.remove("current-character");
        ACTIVE_CELL = String(current_row).concat("-", String(next_col));
        document.getElementById(ACTIVE_CELL).classList.add("current-character");
    }

}

let editor_keyup = (event) => {
    console.log("Editor keydown");
}

editor.addEventListener("keydown", editor_keydown);
editor.addEventListener("keyup", editor_keyup);

document.getElementById("2-0").classList.add("active-row");
document.getElementById("2-1").classList.add("current-character");

document.getElementById("hook").focus();

// Spreadsheet (Output)

let rows = 100;
let columns = 26;