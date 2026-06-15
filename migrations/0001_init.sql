-- Esquema inicial do Loft Hotel Boutique (Cloudflare D1 / SQLite)

-- Configurações singulares do site (armazenadas como JSON em value)
CREATE TABLE IF NOT EXISTS settings (
  key   TEXT PRIMARY KEY,
  value TEXT NOT NULL DEFAULT '{}'
);

-- Acomodações (quartos / suítes)
CREATE TABLE IF NOT EXISTS rooms (
  id          INTEGER PRIMARY KEY AUTOINCREMENT,
  title       TEXT NOT NULL,
  subtitle    TEXT NOT NULL DEFAULT '',
  description TEXT NOT NULL DEFAULT '',
  image_url   TEXT NOT NULL DEFAULT '',
  amenities   TEXT NOT NULL DEFAULT '[]', -- JSON array de strings
  sort_order  INTEGER NOT NULL DEFAULT 0
);

-- Tiles de destaque ("Sua Casa no Paraíso")
CREATE TABLE IF NOT EXISTS highlights (
  id         INTEGER PRIMARY KEY AUTOINCREMENT,
  title      TEXT NOT NULL,
  image_url  TEXT NOT NULL DEFAULT '',
  sort_order INTEGER NOT NULL DEFAULT 0
);

-- Comodidades ("Tudo para seu conforto")
CREATE TABLE IF NOT EXISTS amenities (
  id         INTEGER PRIMARY KEY AUTOINCREMENT,
  icon       TEXT NOT NULL DEFAULT 'check',
  label      TEXT NOT NULL,
  sort_order INTEGER NOT NULL DEFAULT 0
);

-- Depoimentos de hóspedes
CREATE TABLE IF NOT EXISTS testimonials (
  id         INTEGER PRIMARY KEY AUTOINCREMENT,
  title      TEXT NOT NULL,
  quote      TEXT NOT NULL,
  author     TEXT NOT NULL DEFAULT '',
  rating     INTEGER NOT NULL DEFAULT 5,
  sort_order INTEGER NOT NULL DEFAULT 0
);

-- Galeria (estilo Instagram)
CREATE TABLE IF NOT EXISTS gallery (
  id         INTEGER PRIMARY KEY AUTOINCREMENT,
  image_url  TEXT NOT NULL,
  caption    TEXT NOT NULL DEFAULT '',
  sort_order INTEGER NOT NULL DEFAULT 0
);
