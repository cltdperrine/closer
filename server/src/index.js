import "dotenv/config";
import express from "express";
import cors from "cors";
import pool from "./db.js";

// Crée l'app Express
const app = express();

// Middlewares
app.use(cors());
app.use(express.json());

// Route de test
app.get("/api/health", async (req, res) => {
  try {
    const result = await pool.query("SELECT NOW()");
    res.json({ status: "ok" });
  } catch (error) {
    console.error(error);
    res
      .status(500)
      .json({ status: "error", message: "Base de données injoignable" });
  }
});

// Démarre le server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Serveur lancé sur http://localhost:${PORT}`);
});
