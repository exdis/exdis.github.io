import "./style.css";
import { Elm } from "./src/Main.elm";

const root = document.querySelector("#app div");
Elm.Main.init({ node: root });
