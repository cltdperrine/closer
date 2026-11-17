import "dotenv/config";
import express from "express";
import cors from "cors";

// Crée l'app Express
const app = express();

// Middlewares
app.use(cors());
app.use(express.json());

// Route de test
app.get("/api/health", (req, res) => {
  res.json({ status: "ok" });
});

// Démarre le server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Serveur lancé sur http://localhost:${PORT}`);
});
