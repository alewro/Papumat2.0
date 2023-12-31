if (navigator.serviceWorker) {
  navigator.serviceWorker.register("/service-worker.js", { scope: "/" })
    .then(() => navigator.serviceWorker.ready)
    .then((registration) => {
      if ("SyncManager" in window) {
        registration.sync.register("sync-forms");
      }
    }).then(() => console.log("[Companion]", "Service worker registered!"));
}