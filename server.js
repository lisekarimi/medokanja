import express from "express";
import path from "path";
import { exec } from "child_process";

const app = express();
const __dirname = path.resolve();

// Serve static website
app.use("/", express.static(__dirname));

// Serve Docsify docs dynamically at /docs
app.use("/docs", express.static(path.join(__dirname, "docs")));

// Start Docsify server in background
exec("npx docsify serve docs --port 3001", (err) => {
  if (err) console.error("Docsify server error:", err);
});

// Proxy requests to Docsify
import { createProxyMiddleware } from "http-proxy-middleware";
app.use(
  "/docs",
  createProxyMiddleware({
    target: "http://localhost:3001",
    changeOrigin: true,
    pathRewrite: { "^/docs": "" },
  })
);

// Cloud Run expects PORT env var
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
