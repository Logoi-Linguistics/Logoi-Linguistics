let editor = document.getElementById("editor");

for (pane in ["left", "right"]) {
    let pane_div = document.createElement("div");
    pane_div.setAttribute("id", pane);
    pane_div.classList.add("half");
    editor.appendChild(pane_div);
}