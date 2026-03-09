export function preventTabDefault() {
  document.addEventListener("keydown", function (e) {
    if (e.key === "Tab") {
      e.preventDefault();
    }
  });
}
