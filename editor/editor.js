let editor = document.getElementById("editor");

let halves = ["left", "right"];

for (let i = 0; i <= 1; i++) {
    let pane_div = document.createElement("div");
    pane_div.setAttribute("id", halves[i]);
    pane_div.classList.add("pane");
    pane_div.classList.add("half");
    editor.appendChild(pane_div);
}