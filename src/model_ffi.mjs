export function preventTabDefault() {
  document.addEventListener("keydown", function (e) {
    if (e.key === "Tab") {
      e.preventDefault();
    }
  });
}

export function setupFocus() {
  const focus = () => {
    const input = document.getElementById("terminal-input");
    if (input) input.focus();
  };

  // Focus on load
  requestAnimationFrame(focus);

  // Focus when clicking anywhere on the page
  document.addEventListener("click", focus);
}
