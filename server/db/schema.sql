DROP TABLE IF EXISTS rewards, marbles, users;

-- Table des utilisateurs
CREATE TABLE users (
  id SERIAL PRIMARY KEY,                     -- numéro unique, auto-incrémenté
  first_name VARCHAR(50) NOT NULL,           -- texte de 50 caractères max, obligatoire
  email VARCHAR(255) UNIQUE NOT NULL,        -- impossible d'avoir deux fois le même email
  password_hash VARCHAR(255) NOT NULL,       -- le mot de passe hashé, jamais en clair
  created_at TIMESTAMPTZ DEFAULT NOW()       -- date et heure, remplies automatiquement
);

-- Table des billes
CREATE TABLE marbles (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    kind VARCHAR(10) NOT NULL CHECK (kind IN ('closer', 'stay')),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Table des récompenses
CREATE TABLE rewards (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    label VARCHAR(100) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

