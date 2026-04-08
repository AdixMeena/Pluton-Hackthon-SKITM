# ⚡ Pluton — AI-Powered EdTech Platform

> Learn Beyond Limits. Personalized AI learning for every student.

## 🚀 Features

| Feature | Description |
|--------|-------------|
| 🎥 YT Summarizer | Paste any YouTube link → AI generates smart notes by your level |
| 📄 PDF Extractor | Upload PDFs → extract key Q&A and notes |
| 🧠 Quiz Lab | Generate MCQ quizzes from any topic or your notes |
| 💬 Doubt Finisher | AI chat assistant in Hinglish |
| 🗺️ Roadmap Tracker | AI generates personalized learning paths per subject |
| ✅ To-Do & Journal | Daily planner + personal study journal |
| 👤 Profile | XP, achievements, quiz history, level tracking |
| 🎯 Interview System | 8-question assessment for personalized learning profiles |
| 📊 Data Analysis | AI analyzes your learning data to create custom profiles |

---

## 🛠️ Tech Stack

- **Frontend**: React + Vite + Tailwind CSS
- **Backend**: FastAPI + Python
- **AI**: Groq API (Llama models) + GitHub Models
- **Database + Auth**: Supabase
- **Deploy**: Railway (full-stack deployment)

---

## 🚀 Vercel + Render Deployment

### Frontend: Vercel | Backend: Render

### Step 1: Deploy Backend to Render

1. Go to [render.com](https://render.com) and create an account
2. Click **"New"** → **"Web Service"**
3. Connect your GitHub account and select `AdixMeena/Pluton-Full`
4. Configure build settings:
   - **Root Directory**: `backend`
   - **Runtime**: `Python 3`
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `uvicorn main:app --host 0.0.0.0 --port $PORT`

5. Add environment variables:
```
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
GROQ_API_KEY=your-groq-api-key
FRONTEND_URL=https://your-frontend-app.vercel.app
```

6. Click **"Create Web Service"**
7. **Copy the backend URL** (e.g., `https://your-app.onrender.com`)

### Step 2: Deploy Frontend to Vercel

1. Go to [vercel.com](https://vercel.com) and create an account
2. Click **"New Project"**
3. Import your GitHub repository `AdixMeena/Pluton-Full`
4. Configure project:
   - **Root Directory**: `frontend`
   - **Framework Preset**: `Vite`
   - **Build Command**: `npm run build`
   - **Output Directory**: `dist`

5. Add environment variables:
```
VITE_SUPABASE_URL=https://your-project.supabase.co
VITE_SUPABASE_ANON_KEY=your-supabase-anon-key
VITE_BACKEND_URL=https://your-backend-app.onrender.com
```

6. Click **"Deploy"**
7. Your frontend will be live at `https://your-app.vercel.app`

### Step 3: Update Backend Environment Variable

Go back to Render and update:
```
FRONTEND_URL=https://your-frontend-app.vercel.app
```

### 🎯 Final Result:
- **Frontend**: `https://your-app.vercel.app`
- **Backend API**: `https://your-app.onrender.com`

---

## 🐳 Docker Deployment (Alternative)

### Local Development:
```bash
# Copy environment file
cp .env.example .env

# Start all services
docker-compose up --build
```

### Production Docker Deployment:
```bash
# Build and run
docker-compose -f docker-compose.yml up --build -d
```

---

## ⚙️ Local Development Setup

### Step 1: GitHub Repository ✅
Your code is already pushed to: `https://github.com/AdixMeena/roronoazoro.git`

### Step 2: Railway Setup
1. Go to [railway.app](https://railway.app) and sign up/login
2. Click **"New Project"** → **"Deploy from GitHub repo"**
3. Connect your GitHub account and select `roronoazoro` repository
4. Railway will auto-detect your project structure

### Step 3: Environment Variables
In Railway dashboard, go to your project → **Variables** tab and add:

#### Frontend Service Variables:
```
VITE_SUPABASE_URL=https://your-project.supabase.co
VITE_SUPABASE_ANON_KEY=your-supabase-anon-key
VITE_BACKEND_URL=https://your-backend-service.up.railway.app
```

#### Backend Service Variables:
```
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_SERVICE_ROLE_KEY=your-supabase-service-role-key
GROQ_API_KEY=your-groq-api-key
FRONTEND_URL=https://your-frontend-service.up.railway.app
```

### Step 4: Database Setup
1. Create a Supabase project at [supabase.com](https://supabase.com)
2. Go to **SQL Editor** → paste contents of `supabase-schema.sql` → Run
3. Copy the URL and keys from **Project Settings → API**

### Step 5: Deploy
Railway will automatically deploy both frontend and backend. Your app will be live at:
- Frontend: `https://your-project-name.up.railway.app`
- Backend API: `https://your-project-name-backend.up.railway.app`

---

## ⚙️ Local Development Setup

### 1. Clone and install
```bash
git clone https://github.com/AdixMeena/roronoazoro.git
cd roronoazoro
```

### 2. Frontend Setup
```bash
cd frontend
npm install
npm run dev
```

### 3. Backend Setup
```bash
cd backend
pip install -r requirements.txt
uvicorn main:app --reload
```

### 4. Environment Variables
Create `.env` files in both `frontend/` and `backend/` directories:

**frontend/.env:**
```env
VITE_SUPABASE_URL=https://your-project.supabase.co
VITE_SUPABASE_ANON_KEY=your-anon-key-here
VITE_BACKEND_URL=http://localhost:8000
```

**backend/.env:**
```env
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
GROQ_API_KEY=your-groq-api-key
FRONTEND_URL=http://localhost:5173
```
VITE_GITHUB_TOKEN=your-github-models-token
VITE_AI_MODEL=openai/gpt-4o
```

### 5. Run locally
```bash
npm run dev
```

---

## 🌐 Deploy to Vercel

```bash
npm run build
# Then push to GitHub and connect to Vercel
# Add your .env variables in Vercel → Settings → Environment Variables
```

---

## 📁 Project Structure

```
src/
├── components/
│   ├── AppLayout.jsx      # Main layout with sidebar + mobile nav
│   ├── Sidebar.jsx        # Navigation sidebar
│   ├── StarField.jsx      # Cosmic background animation
│   └── ProtectedRoute.jsx # Auth guard
├── context/
│   └── AuthContext.jsx    # Global auth state
├── lib/
│   └── clients.js         # Supabase + GitHub Models AI setup
├── pages/
│   ├── Landing.jsx        # Public landing page
│   ├── Auth.jsx           # Login / Signup
│   ├── Dashboard.jsx      # Home with subjects & stats
│   ├── YTSummarizer.jsx   # YouTube → AI notes
│   ├── PDFExtractor.jsx   # PDF → notes + Q&A
│   ├── QuizLab.jsx        # Quiz generator + taker
│   ├── DoubtFinisher.jsx  # AI chat
│   ├── Roadmap.jsx        # Subject roadmap tracker
│   ├── TodoJournal.jsx    # To-do + journal
│   └── Profile.jsx        # User profile + achievements
├── App.jsx                # Router setup
├── main.jsx               # Entry point
└── index.css              # Global cosmic styles
```

---

## 🎨 Design System

- **Colors**: Cosmic dark theme — deep space blues + nebula purples + aurora greens
- **Fonts**: Syne (headings) + DM Sans (body) + JetBrains Mono (code)
- **Components**: Glass morphism cards with blur effects
- **Responsive**: Full mobile support with bottom nav

---

## 🤝 GitHub Student Pack Benefits Used

- ✅ **GitHub Models** — Free GPT-4o AI via Azure endpoint
- ✅ **Vercel** — Free frontend hosting
- ✅ **Namecheap** — Free .me domain (apply separately)
- ✅ **Supabase** — Free tier database (25k MAU)

---

Built with 💜 for students who want to learn smarter, not harder.
