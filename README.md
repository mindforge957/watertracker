# Water Tracker 💧 — Setup Guide

A real-time water tracking app with **Supabase** backend, anti-gravity UI, and live Tracker ↔ Viewer syncing.

---

## 🚀 Quick Setup (5 minutes)

### 1. Create a Supabase Project

1. Go to [supabase.com](https://supabase.com) and sign in (free tier works)
2. Click **New Project** → give it a name (e.g. `water-tracker`)
3. Choose a region close to you → click **Create**
4. Wait for the project to finish provisioning (~1 min)

### 2. Run the Database Setup

1. In your Supabase dashboard, go to **SQL Editor** (left sidebar)
2. Click **New Query**
3. Open `setup.sql` from this folder and paste the entire contents
4. Click **Run** (or `Ctrl+Enter`)
5. You should see "Success. No rows returned" — that's correct

### 3. Get Your Credentials

1. Go to **Settings** → **API** in the Supabase dashboard
2. Copy your **Project URL** (looks like `https://xxxx.supabase.co`)
3. Copy your **anon/public** key (the long `eyJ...` string)

### 4. Configure the App

Open `index.html` and find these two lines near the top of the `<script>`:

```javascript
const SUPABASE_URL  = 'YOUR_SUPABASE_URL';
const SUPABASE_KEY  = 'YOUR_SUPABASE_ANON_KEY';
```

Replace them with your actual values:

```javascript
const SUPABASE_URL  = 'https://xxxx.supabase.co';
const SUPABASE_KEY  = 'eyJhbGciOi...';
```

### 5. Open the App

Just double-click `index.html` to open it in your browser. No server needed!

---

## 🎮 How It Works

### Tracker Mode
- Click the glass to log water
- Each click increments your daily count in Supabase
- A unique **User ID** is generated for you (shown on screen)
- Share this ID with someone so they can watch your progress

### Viewer Mode
- Enter a Tracker's **User ID**
- See their progress update **in real-time** (no refresh needed)
- Read-only — no clicking

---

## 🌐 Deployment Options

### GitHub Pages
1. Push the folder to a GitHub repo
2. Go to **Settings** → **Pages** → set source to `main` branch
3. Your app will be live at `https://username.github.io/repo-name`

### Vercel
1. Push to GitHub
2. Import in [vercel.com](https://vercel.com) → Deploy
3. Done — instant HTTPS URL

### Netlify
1. Drag the `water` folder into [netlify.com/drop](https://app.netlify.com/drop)
2. Instant deploy with a free URL

---

## 📁 Files

| File | Purpose |
|---|---|
| `index.html` | Complete app (HTML + CSS + JS) |
| `setup.sql` | Supabase database setup script |
| `README.md` | This file |
