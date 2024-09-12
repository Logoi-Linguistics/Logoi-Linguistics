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

for (let i = 0; i < editor_rows; i++) {
    let row = document.createElement("tr");
    for (let j = 0; j < editor_columns; j++) {
        let column = document.createElement("td");
        if (j == 0) {
            column.classList.add("gutter");
            column.appendChild(document.createTextNode(String(i)));
        } else {
            column.classList.add("character");
            column.appendChild(document.createTextNode("λ"));
        }
        row.appendChild(column);
    }
    ide_body.appendChild(row);
}

ide.appendChild(ide_body);
document.getElementById("left").appendChild(ide);

// Spreadsheet (Output)

let rows = 100;
let columns = 26;