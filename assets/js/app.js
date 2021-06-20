// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
import "phoenix_html"
import {Socket} from "phoenix"
import topbar from "topbar"
import {LiveSocket} from "phoenix_live_view"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")

window.liveSocket = liveSocket
let Hooks = {};
Hooks.buttonUpEvent = {
  mounted()
  {
    this.handleEvent("buttonUpEvent", (payload) => {
      document.getElementById('light-on').classList.remove('js-button-visible');
      applyOpacityBrightness(payload.pourcent);
    })
  },
}
Hooks.buttonDownEvent = {
  mounted()
  {
    this.handleEvent("buttonDownEvent", (payload) => {
      if (payload.pourcent <= 0)
        document.getElementById('light-on').classList.add('js-button-visible');
      
      applyOpacityBrightness(payload.pourcent);
    })
  },
}
Hooks.buttonOnEvent = {
  mounted()
  {
    this.handleEvent("buttonOnEvent", () => {
      document.getElementById('light-on').classList.remove('js-button-visible');
      applyOpacityBrightness(100);
    })
  },
}
Hooks.buttonOffEvent = {
  mounted()
  {
    this.handleEvent("buttonOffEvent", () => {
      document.getElementById('light-on').classList.add('js-button-visible');
      applyOpacityBrightness(0);
    })
  },
}
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}, hooks: Hooks})

// Show progress bar on live navigation and form submits
topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", info => topbar.show())
window.addEventListener("phx:page-loading-stop", info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()

function applyOpacityBrightness(pourcent) 
{
  document.getElementById('jsOverlay').style.background = "rgba(0, 0, 0, " + (100 -  pourcent) + "%)";
}