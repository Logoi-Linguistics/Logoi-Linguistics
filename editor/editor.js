let editor = document.getElementById("editor");

let halves = ["left", "right"];

for (let i = 0; i <= 1; i++) {
    let pane_div = document.createElement("div");
    pane_div.setAttribute("id", halves[i]);
    pane_div.classList.add("pane");
    pane_div.classList.add("half");
    editor.appendChild(pane_div);
}

// Editor (Input)

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

let ide_keydown = (event) => {
    console.table(event);
}

let ide_keyup = (event) => {
    console.table(event);
}

ide.addEventListener("keydown", ide_keydown);
ide.addEventListener("keyup", ide_keyup);

document.getElementById("2-0").classList.add("active-row");
document.getElementById("2-1").classList.add("current-character");

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

// Spreadsheet (Output)

let rows = 100;
let columns = 26;