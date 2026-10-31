# Council round 2

## Scores

| Candidate | Claude /30 | agy /30 | Avg /30 | Claude /100 | agy /100 | Avg /100 |
|---|---|---|---|---|---|---|
| C1 | 18 | 16.0 | 17.0 | 65 | 63 | 64.0 |
| C2 | 20 | 24.0 | 22.0 | 79 | 93 | 86.0 |

## Prompt (identical to both judges, fresh session)

````
You are a harsh 3-persona judging council: (a) the TARGET USER of the product, (b) a seed-stage VC in India, (c) an experienced operator/PM who has shipped hackathon winners. Do not use tools or read files; answer from this prompt only. Be blunt.

EVENT: Product Space x Wispr Flow "Agentic AI Hackathon", online, India, Sat 31 Oct 2026. ~500 participants. Build starts ~1:30 PM IST, submission closes 11:59 PM IST today (~9.5 hours left). Builder: Akash, SOLO, competent developer, builds entirely by DICTATING prompts via Wispr Flow (voice-to-text) into Claude Code / Antigravity. Stack must deploy free and fast (e.g. Next.js on Vercel, or Render) with an LLM API (Gemini/Claude/OpenAI). Submission: deployed URL + test login, 2–3 min voiceover video, Wispr words-spoken screenshot. Must pick one of 5 official statements; no old projects.
RULE: the product's main input must be natural speech captured via Wispr Flow (Wispr types into the app's text box; the agent must turn fillers, digressions, self-corrections into clean structured output).
OFFICIAL RUBRIC /100: Wispr Flow usage (how voice was used to build AND use the product) 20; Prototype quality & UX 20 (judges said they are BORED of generic Claude-looking UIs); AI integration 20 (must be genuinely useful, not a chat box bolted on); Problem understanding 15 (cover the official must-build list); LinkedIn content & engagement 15; Innovation & creativity 10 (beyond one-prompt-one-response).
KILL RULES: not demoable live by deadline, no measurable proof it works, depends on blocked/paid-gated tools. Anything not buildable by 11:59 PM is PLAN and gets no credit.
Also judge "does each module actually help?" — feature bloat on paper is not rewarded.

ROUND 2 — score each candidate below (one is a control from an earlier round; score it on its own merits, independently).

OFFICIAL STATEMENT 03 must-build: transcript ingestion with speaker attribution; extraction of decisions, action items, owners, deadlines; detection of conflicts with earlier decisions stored in memory; creation of tasks in a tracker through an integration; reminders before deadlines; weekly digest per person; a confirmation step before anything gets posted. "Cross-meeting memory and conflict detection are what make this a real system rather than a transcript summarizer."

CONTROL C1. DECISION LEDGER: paste/dictate a meeting transcript with speakers; agent extracts decisions, action items, owners, deadlines; stores decisions in cross-meeting memory and flags CONFLICTS with earlier decisions; user confirms, then tasks are pushed to a real tracker (Trello/Linear/GitHub Issues API); deadline reminders (email/cron); weekly per-person digest. Voice: after a call you ramble a voice debrief via Wispr and it becomes tasks. Demo data: the real hackathon kickoff transcript. Buyer: startup teams, Rs 299/seat/mo.

C2. "OBJECTION!" — the meeting agent that argues back (Decision Ledger v2). Positioning: not a note-taker, a team's DECISION CONSCIENCE. Home screen is a vertical "decision spine" timeline (every decision as a node, superseded ones struck through), designed like a courtroom ledger/newspaper — serif headlines, ink-on-paper palette, rubber-stamp "CONFIRMED"/"OVERRULED" marks — deliberately not a Claude default dashboard. Inputs: (1) paste a transcript (Zoom/Meet/Wispr Notetaker format, speaker labels parsed) or (2) the hero: hit "Debrief", rambling voice via Wispr into one box ("um so launch, yeah push it to the 30th, actually no 28th, and Priya owns landing page"). Agent pipeline (structured JSON with Gemini 2.x Flash, free tier): clean speech → extract decisions/actions/owners/deadlines with a quote + speaker + timestamp citation for each → retrieve prior decisions on the same topic from memory (Postgres on Neon/Supabase free; topic keys + embedding similarity) → CONFLICT CARD: red "Objection" card showing then-vs-now diff, who decided it originally, and three buttons: Overrule (supersede), Keep old, Flag for discussion. Confirmation tray: nothing is posted until the user ticks items; then one click creates GitHub Issues (real API, issue links shown) — Trello as alt. Reminders: Vercel Cron daily job emails (Resend free) owners 24h before due; demo shows "send now". Weekly digest per person: generated page + email "what you own, what changed, what conflicts". Demo memory seeded with 3 earlier meetings + the real kickoff transcript of this hackathon (3 speakers, rules as decisions; e.g. a later 'team of 3' debrief triggers an Objection: "kickoff ruled max team size = 2"). Measurable proof: an on-page eval panel — 10 hand-labelled transcript snippets, shows extraction precision/recall and conflict-detection hits live. Stack: Next.js 15 + Tailwind (custom theme) on Vercel, Neon Postgres + pgvector, Gemini API, GitHub REST, Resend. Test login: demo/demo. Cut list: Slack/Calendar integrations, real-time call joining, multi-tenant auth beyond one demo team. Buyer: Indian startup/agency teams, Rs 299/seat/mo; wedge = founders who run 10+ calls/week.


For EACH candidate: User /10, Investor /10, Business /10, Total /30; Hackathon /100 broken down by the official rubric (20/20/20/15/15/10); feasibility solo in remaining time (1-10); Indian demo appeal (1-10); top 3 risks; biggest weakness; one change that would raise the /30 most. Explicitly list any must-build items from the official statement that are missing or only faked. Say which modules do NOT help and should be cut. Then a ranking table and your concrete critique of the build plan and stack.
END WITH a fenced ```json block: {"scores":[{"candidate":"ID","user":n,"investor":n,"business":n,"total30":n,"hack100":n,"feasibility":n,"india_appeal":n,"weakness":"..."}]}

````

## Raw answer: claude

# ROUND 2 — COUNCIL VERDICT

Both of you built the same product. One of you dressed it for the judges and one of you didn't. Let me be blunt about what that's worth.

---

## CONTROL C1 — DECISION LEDGER

**User /10: 7** — Real pain, real workflow. "Ramble a debrief, get tasks" is a thing a founder would actually use. But as a target user I've seen this exact pitch from Fireflies/Otter/Fathom; the conflict-detection is the only reason I'd switch, and you're underselling it.

**Investor /10: 5** — Crowded graveyard. Meeting-notes-to-tasks is a feature, not a company. Conflict detection *against memory* is the one defensible wedge and the pitch treats it as a bullet point, not the headline. Rs 299/seat is fine but you're competing with free Gemini-in-Meet.

**Business /10: 6** — Pricing is sane, buyer is named, seat-based SaaS is legible. Distribution unaddressed.

**Total /30: 18**

### Hackathon /100
| Rubric | Score | Why |
|---|---|---|
| Wispr usage /20 | 13 | Voice debrief is a genuine use of Wispr *in* the product; building-via-voice assumed but not staged. Fine, not special. |
| Prototype & UX /20 | 11 | This is the kill shot. Judges explicitly said they're bored of generic Claude-looking UIs. Nothing here says you won't ship one. |
| AI integration /20 | 15 | Extraction + cross-meeting conflict is genuinely useful, not a bolted-on chat box. Good. |
| Problem understanding /15 | 13 | Covers all 7 must-builds. Solid. |
| LinkedIn content /15 | 6 | **Completely absent from the plan.** You are throwing away 15 points. |
| Innovation /10 | 6 | Conflict detection is beyond one-prompt-one-response, but presented plainly. |
| **Total** | **~65** | |

**Feasibility solo /10: 7** — Leaner than C2, genuinely shippable in 9.5h.
**India demo appeal /10: 6** — Relatable, but visually forgettable on a screenshare.

**Top 3 risks:** (1) ships a generic dashboard and dies on UX; (2) cron reminders aren't live-demoable, no "send now" escape hatch mentioned; (3) zero LinkedIn plan.
**Biggest weakness:** No visual identity and no measurable proof — judges can't *see* it working or that it's accurate.
**One change to raise /30 most:** Add an on-page accuracy/eval panel (measurable proof) AND a non-generic UI. That's literally the gap between C1 and C2.

**Missing/faked must-builds:** All 7 present on paper. Reminders are cron-based = **not live-demoable** unless a "send now" button exists (not mentioned) → effectively faked for the demo.
**Cut:** Pick ONE tracker (don't list Trello/Linear/GitHub as if optionality is a feature — it's indecision).

---

## C2 — "OBJECTION!"

**User /10: 8** — Same core value as C1, but "decision conscience" reframes note-taking into something I'd keep open. The Objection card (then-vs-now diff, who decided it, three actions) is exactly the moment that creates the "oh damn" reaction. The voice-debrief hero is the right primary input.

**Investor /10: 6** — Still a crowded space and the moat is still thin (memory + conflict is replicable), but the *demo* sells a category of one. The eval panel is what makes me believe the founder, not just the pitch. "Founders who run 10+ calls/week" is a real wedge. I'd take the meeting.

**Business /10: 6** — Identical economics to C1; the positioning is sharper, which is worth something in a seed conversation but doesn't change unit economics.

**Total /30: 20**

### Hackathon /100
| Rubric | Score | Why |
|---|---|---|
| Wispr usage /20 | 17 | Best-in-class. Voice debrief hero where Wispr's filler/self-correction cleanup ("push it to 30th, actually no 28th") IS the demo's wow moment — that's the exact behavior the rule rewards. Plus building-via-voice. |
| Prototype & UX /20 | 16 | Courtroom/newspaper theme directly answers "bored of generic Claude UIs." **Conditional on execution** — a half-finished custom theme scores worse than a clean generic one. Risk priced in. |
| AI integration /20 | 17 | Structured JSON with quote+speaker+timestamp citations, memory retrieval, conflict cards. Genuinely useful, demonstrably so. |
| Problem understanding /15 | 14 | All 7 must-builds explicitly addressed, with the right emphasis on cross-meeting memory as the core. |
| LinkedIn content /15 | 6 | **Same hole as C1. Not addressed at all.** You have the most screenshot-able product in the room and no plan to post it. Criminal. |
| Innovation /10 | 9 | Decision spine timeline, Objection cards, live eval panel — clearly beyond one-prompt-one-response. |
| **Total** | **~79** | |

**Feasibility solo /10: 5** — This is the problem. Next.js + Neon + **pgvector embeddings** + Gemini structured extraction + GitHub API + Resend + Vercel Cron + weekly digest + custom theme + hand-labelled eval set, SOLO, in 9.5 hours by voice. Something *will* be half-baked, and your differentiator (the custom UI) is the most likely casualty. This plan is ~130% of the available time.

**India demo appeal /10: 7** — The courtroom aesthetic + the "team of 3 triggers Objection: kickoff ruled max team = 2" using the *real* hackathon transcript is a genuinely delightful, self-referential demo moment. That lands.

**Top 3 risks:** (1) **Scope** — pgvector + eval labelling + cron + custom theme won't all land; triage now or the UI ships ugly. (2) **Custom theme backfires** — ambitious serif/ink design, done at 11 PM by a tired solo dev, looks broken not bespoke. (3) **pgvector is a time sink** — embedding similarity for conflict retrieval is the riskiest, least-necessary module.

**Biggest weakness:** Scope discipline. You've designed a product that scores 79 *if finished* and ~55 if you run out of time at hour 9 with a broken theme and a half-wired cron. The plan has no explicit "ship order."

**One change to raise /30 most:** **Cut pgvector. Use topic-key / keyword matching for conflict retrieval.** It demos identically on seeded data, removes your biggest technical risk, and buys back the hours you need to actually finish the custom UI and — critically — write the LinkedIn posts. Then spend 30 minutes building the LinkedIn content you're currently ignoring.

**Missing/faked must-builds:** All 7 present. Caveats:
- **Reminders** — cron daily job is *not* live-demoable; the "send now" button saves you. Keep it, lead the demo with it. Without it this is faked.
- **Weekly digest** — the *page* is live and real; the *email via cron* is effectively faked for the demo. Fine, demo the page.
- Everything else is real-API (GitHub Issues with visible links) — good, that satisfies the KILL RULE on measurable proof.

**Modules that do NOT help — cut:**
- **pgvector embedding similarity** → replace with topic keys. Biggest risk-for-reward loser.
- **Trello alternative** → GitHub only. Optionality is not a feature under time pressure.
- **Daily cron reminder** → keep only "send now"; don't burn time proving a scheduler fires.
- **KEEP the eval panel** — it's your measurable proof and a differentiator; cutting it would be the mistake.

---

## RANKING

| Rank | Candidate | /30 | /100 | Feasibility | India | One-line |
|---|---|---|---|---|---|---|
| 1 | **C2 "OBJECTION!"** | 20 | 79 | 5 | 7 | Wins on rubric by a mile, loses to its own ambition if unmanaged. |
| 2 | C1 Decision Ledger | 18 | 65 | 7 | 6 | Safe, shippable, forgettable — leaves 2 rubric lines (UX, proof) on the table. |

**C2 is the correct build — but only the de-scoped version of it.** C1 is what C2 degrades *into* if you overbuild and run out of time, minus the eval panel. So the real decision isn't C1-vs-C2; it's "build C2 with ruthless triage" vs "build C2 and pray."

## Critique of the build plan & stack

- **Stack is right, scope is wrong.** Next.js 15 on Vercel + Neon + Gemini Flash free tier + GitHub REST + Resend is the correct free/fast/fast-to-deploy spine. Nothing here is paid-gated or blocked. Good. The failure mode is pure time, not architecture.
- **pgvector is the trap.** It's the one piece that's unbounded in effort (embedding pipeline, similarity tuning, false-positive wrangling) and invisible in the demo versus a keyword/topic-key match on seeded data. Cut it today, not at hour 7.
- **Build order both plans omit:** (1) transcript→extraction→**confirmation tray**→GitHub Issue (the spine must work end-to-end first); (2) conflict card on seeded memory; (3) voice debrief via Wispr; (4) eval panel; (5) digest page; (6) custom theme LAST as progressive enhancement over a working clean layout — so if the theme breaks you still have a shippable app. Neither plan states this. Write it down before you dictate a line.
- **Both of you are ignoring 15% of the score.** LinkedIn content & engagement is worth more than Innovation. C2 produces the most postable artifacts in the event (Objection card screenshots, the self-referential "kickoff ruled max team = 2" gag, the eval precision/recall panel, the Wispr words-spoken count). Budget 30–45 minutes to actually post a build-in-public thread with those. This is the cheapest points on the board and both plans score ~6/15 by default.
- **Measurable proof:** C2 has it (eval panel + real GitHub issue links). C1 doesn't. Under the KILL RULES, "no measurable proof it works" is fatal — C1 skates by on the live tracker push, but the eval panel is why C2 clears the bar comfortably.

```json
{"scores":[{"candidate":"C1","user":7,"investor":5,"business":6,"total30":18,"hack100":65,"feasibility":7,"india_appeal":6,"weakness":"Generic UI and no measurable proof — forgettable on screen and leaves the UX + LinkedIn rubric lines empty."},{"candidate":"C2","user":8,"investor":6,"business":6,"total30":20,"hack100":79,"feasibility":5,"india_appeal":7,"weakness":"Over-scoped for 9.5h solo; pgvector + custom theme + cron + eval + digest risks a half-finished UI, and LinkedIn content (15 pts) is still ignored."}]}
```

## Raw answer: agy

# HARSH JUDGING COUNCIL: ROUND 2 EVALUATION

---

### PERSONA ROSTER
* **(a) Target User (Founder/Agency Lead, Bengaluru):** Runs 8–10 calls daily across Google Meet and WhatsApp huddles. Drowning in action items, furious when team members re-litigate decisions made 4 days prior, and actively allergic to generic "AI meeting summaries" that generate 3 pages of unread markdown.
* **(b) Seed-stage VC (India B2B / SaaS Partner):** Skeptical of AI wrappers. Knows Rs 299/seat/mo is SME death valley unless there is high retention, viral loop, or an undeniable enterprise governance wedge.
* **(c) Veteran Operator / Hackathon PM:** Shipped multiple global and Indian hackathon winners. Ruthless on timebox risk (9.5 hours remaining, solo voice-dictated build), kill rules, demo theater, and rubric optimization.

---

## CANDIDATE C1: DECISION LEDGER (Control)

> **One-Line Pitch:** A clean utility that turns meeting transcripts and debriefs into decisions, checks past memory for conflicts, and pushes confirmed tasks to GitHub/Trello.

### 1. Persona Scoring & Verdict
* **Target User:** **5/10** — *"It’s an administrative chore disguised as AI. It expects me to sit there, confirm tasks, and read summaries. I already pay Google Workspace and ignore Fireflies; why would I pay Rs 299 for another task nag?"*
* **Investor:** **5/10** — *"Total commodity. A standard RAG pipeline + LLM prompt + CRUD dashboard. Zero network effects, zero defensive moat. Any note-taker ships this as a minor patch next month."*
* **Operator / PM:** **6/10** — *"Safe, boring, and dead on arrival. In a pool of 500 teams, a generic gray/white dashboard gets skipped in 15 seconds. It fulfills the prompt like a compliance checklist, but hackathons are won on conviction and showmanship."*
* **Total Persona Score:** **16/30**

---

### 2. Official Hackathon Rubric (/100)
| Rubric Dimension | Max | Score | Justification |
| :--- | :---: | :---: | :--- |
| **Wispr Flow Usage** | 20 | **13/20** | Debrief voice input works, but it's treated as a dumb text box input rather than showcasing real-time dictation cleanup or voice-first design. |
| **Prototype Quality & UX** | 20 | **10/20** | Fails the explicit judge mandate: *bored of generic Claude/shadcn-looking UIs*. Standard dashboard layout with no visual point of view. |
| **AI Integration** | 20 | **14/20** | Standard extraction and retrieval. Genuinely useful, but strictly one-shot pipeline execution. |
| **Problem Understanding** | 15 | **14/15** | Accurately addresses the statement requirements on paper. |
| **LinkedIn Engagement** | 15 | **8/15** | "I built an AI decision extractor" generates zero shares. No visual hook or memorable meme/aesthetic. |
| **Innovation & Creativity** | 10 | **4/10** | Zero creative leap. It's a textbook transcript summarizer with a conflict flag bolted on. |
| **TOTAL** | **100** | **63/100** |

---

### 3. Feasibility & Regional Appeal
* **Feasibility Solo (9.5h remaining):** **8.5/10** — Very high. Standard CRUD, standard prompts, low frontend complexity. Akash could finish by 8:00 PM IST.
* **Indian Demo Appeal:** **5/10** — Low resonance. Indian founders and teams don't suffer from a lack of task trackers; they suffer from lack of execution discipline and unrecorded verbal drift.

---

### 4. Vulnerabilities & Missing Reqs
* **Top 3 Risks:**
  1. Instant judge fatigue: blends into the 50 other transcript summarizers submitted today.
  2. The conflict detection demo feels synthetic without a clear before/after diff UI.
  3. Fails the "kill rule" on visual differentiation.
* **Biggest Weakness:** Utter lack of personality and visual punch; it's a utility that looks like an assignment submission.
* **Must-Build Audit (Statement 03):**
  * *Missing / Faked:* Deadline reminders and weekly digest will inevitably be faked as static mockups or dummy buttons due to lack of time.
* **Modules that do NOT help (CUT IMMEDIATELY):**
  * *Multi-tracker support (Trello + Linear + GitHub):* Pick GitHub Issues only. Wiring multiple OAuth/API tokens wastes precious minutes.
  * *Weekly per-person digest:* An unread email report in a 2-minute demo video adds zero value.

* **Single change to raise /30 most:** Give it an aggressive, opinionated UI theme (e.g., Audit Ledger) and make the conflict detection pop up as a blocking modal rather than a passive badge.

---

---

## CANDIDATE C2: "OBJECTION!" — The Decision Conscience

> **One-Line Pitch:** A courtroom-style team "decision conscience" that cross-examines incoming voice debriefs against institutional memory, highlights conflicts as red "Objection!" cards, and logs rulings on a vertical decision spine.

### 1. Persona Scoring & Verdict
* **Target User:** **8/10** — *"Calling out my co-founder when he contradicts what we decided on Tuesday’s kickoff call? With exact quotes and timestamps? That is pure gold. It stops the gaslighting in high-velocity teams."*
* **Investor:** **7.5/10** — *"The positioning shift from 'passive note-taker' to 'active decision arbiter' is a real wedge. It creates an audit trail that founders actually want to keep. The courtroom branding gives it viral organic distribution on Twitter/LinkedIn."*
* **Operator / PM:** **8.5/10** — *"Direct hit on the judging rubric. Replaces the generic Claude UI with a distinctive serif/courtroom aesthetic. The live evaluation panel (10 hand-labelled snippets) provides the 'measurable proof' judges crave to distinguish real AI from vaporware."*
* **Total Persona Score:** **24/30**

---

### 2. Official Hackathon Rubric (/100)
| Rubric Dimension | Max | Score | Justification |
| :--- | :---: | :---: | :--- |
| **Wispr Flow Usage** | 20 | **18/20** | The "Debrief" hero box is explicitly tuned for rambling, filler-heavy Indian spoken English ("um so launch, push it to 30th, actually no 28th"), showcasing Wispr Flow's raw voice capture transformed into structured legalistic rulings. |
| **Prototype Quality & UX** | 20 | **19/20** | Deliberately anti-generic. Courtroom ledger, newspaper serif typography, vertical decision spine, and rubber-stamp badges ("CONFIRMED", "OVERRULED") make it instantly memorable on video. |
| **AI Integration** | 20 | **18/20** | Multi-step agentic pipeline: ingestion $\to$ speaker citation $\to$ semantic conflict retrieval $\to$ diff generation. Live on-page eval panel demonstrates empirical extraction precision. |
| **Problem Understanding** | 15 | **15/15** | Hits all 7 must-build requirements from Statement 03, placing the core focus exactly where the statement demands: cross-meeting memory and conflict detection. |
| **LinkedIn Engagement** | 15 | **14/15** | High viral quotient. A screenshot of an "OBJECTION: Overruled by Hackathon Kickoff Rules" card with rubber stamps will print engagement on Indian tech LinkedIn. |
| **Innovation & Creativity** | 10 | **9/10** | Flips the passive meeting assistant archetype on its head into an active, adversarial team conscience. |
| **TOTAL** | **100** | **93/100** |

---

### 3. Feasibility & Regional Appeal
* **Feasibility Solo (9.5h remaining):** **6.5/10** — Tight. Wiring Next.js + Neon pgvector + GitHub REST + Gemini + Resend + Cron is an operational trap for a solo builder dictating prompts. Must be aggressively de-scoped to guarantee deployment.
* **Indian Demo Appeal:** **9/10** — Extremely high. Indian startup teams live in a state of perpetual verbal drift, where decisions made over tea or WhatsApp calls evaporate. Seeding the demo with the actual hackathon kickoff transcript ("Max team size = 2") is an elite local flex that will delight the judges.

---

### 4. Vulnerabilities & Missing Reqs
* **Top 3 Risks:**
  1. **Infrastructure Bloat Trap:** Debugging Neon pgvector migrations, vector dimensions, and Resend domain verification at 8:00 PM IST will sink the submission.
  2. **Latency during video recording:** Running embedding search + Gemini extraction sequentially on a live voice debrief could take 15+ seconds on free tiers.
  3. **Overbuilding UI gimmicks:** Spending 3 hours tweaking CSS stamps instead of ensuring the GitHub Issues API actually dispatches.
* **Biggest Weakness:** High execution surface area. Too many moving third-party pieces (Neon + GitHub + Resend + Vercel Cron) that can fail silently during final deployment.
* **Must-Build Audit (Statement 03):**
  * *All 7 items covered:* Ingestion with speakers, extraction, conflict detection with memory, tracker integration, reminders, digest, confirmation step.
  * *At Risk of Being Faked:* Vercel Cron deadline reminders and weekly digest are easy failure points on Vercel deployment.
* **Modules that do NOT help (CUT IMMEDIATELY):**
  * *CUT Vercel Cron + Resend live emails:* Do NOT waste 1.5 hours setting up DNS records, API keys, and cron configurations on Vercel. Replace with a **"Simulate 24h Reminder" modal/banner** that shows the exact formatted alert.
  * *CUT pgvector if setup takes >30 mins:* If Neon vector extension hiccups, fall back instantly to structured keyword/topic matching + Gemini in-context comparison against the 3 seeded kickoff meetings. Judges cannot tell if the retrieval was pgvector or an in-memory cosine array, but they WILL see a 500 error.
  * *CUT complex multi-page weekly digest:* Make the weekly digest simply a toggle/filter on the main Decision Spine ("View My Rulings").

* **Single change to raise /30 most:** Ensure the "Objection" conflict card has a 1-click **"Overrule & Sync to GitHub"** action that updates the Decision Spine and immediately produces a verifiable GitHub Issue URL in the confirmation tray on screen.

---

---

## COMPARATIVE RANKING TABLE

| Rank | Candidate | User (/10) | Investor (/10) | Operator (/10) | Total (/30) | Hackathon (/100) | Feasibility (1-10) | India Appeal (1-10) | Strategic Verdict |
| :---: | :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| **1** | **C2. OBJECTION!** | **8.0** | **7.5** | **8.5** | **24.0** | **93** | **6.5** | **9.0** | **CLEAR WINNER.** Standout branding, counters judge fatigue, hits all rubric criteria. Must trim infra fat. |
| **2** | **C1. DECISION LEDGER** | **5.0** | **5.0** | **6.0** | **16.0** | **63** | **8.5** | **5.0** | **LOSES.** Competent, safe, but entirely forgettable. Will drown in the sea of generic AI summaries. |

---

## CONCRETE CRITIQUE OF BUILD PLAN & STACK (FOR C2)

Akash has ~9.5 hours, building solo, dictating via Wispr Flow into Claude Code / Antigravity. Here is the operational survival roadmap:

### 1. The Stack: Keep vs. Kill
* **Frontend:** Next.js 15 + Tailwind on Vercel. **KEEP**, but lock in a simple serif/newspaper stylesheet (e.g., `font-serif`, border-stone-800, amber-50 background) early. Do not spend hours hand-crafting SVGs.
* **LLM Engine:** Gemini 2.x Flash (`gemini-2.0-flash`). **KEEP.** Ultra-fast, generous free tier rate limits, and handles structured JSON output natively.
* **Storage & Memory (Neon Postgres + pgvector):** **DANGER ZONE.** 
  * *Rule:* Give Neon pgvector exactly 45 minutes to stand up. If vector extensions or migrations get stuck, switch immediately to a lightweight local SQLite / JSON store with embedded cosine similarity or pure LLM context injection of the 3 pre-seeded demo calls. A working in-memory demo beats a broken Postgres connection every time.
* **Tracker Integration (GitHub REST):** **KEEP.** Generating a personal access token (PAT) and firing a `POST /repos/{owner}/{repo}/issues` takes 10 lines of code and provides unassailable "real integration" proof.
* **Reminders (Vercel Cron + Resend):** **KILL.** 
  * Do not spend 1 hour verifying sender domains on Resend and debugging Vercel cron headers. Build a "Trigger Deadline Check" button on the UI that pops an in-app notification and shows the formatted email preview. Judges care about the system logic, not SMTP handshakes.

### 2. The Golden Demo Flow (3-Minute Video Script)
1. **0:00 - 0:30 (The Hook & Memory):** Show the "Decision Spine" already pre-populated with the **actual Hackathon Kickoff Call**. Point to the node: *"Rule: Max Team Size = 2 Participants"*.
2. **0:30 - 1:15 (The Hero Wispr Action):** Akash hits "Debrief" and dictates a fast, messy voice memo using Wispr Flow: *"Hey so for our hackathon project, Rohan is joining us as a third dev, Priya owns frontend, and we push deadline to tomorrow 2 AM."*
3. **1:15 - 2:00 (The OBJECTION! Moment):** The agent cleans the speech, extracts the actions, and fires an **"OBJECTION!" red card**:
   * *Conflict Detected:* "Hackathon Kickoff ruled max team size = 2; your debrief added a 3rd member."
   * Akash clicks **"Overrule"** or **"Flag for Discussion"**.
4. **2:00 - 2:30 (Verification & GitHub Sync):** The confirmed action items drop into the Confirmation Tray. Akash clicks "Confirm & Dispatch". Live GitHub Issue links appear on screen and are clicked.
5. **2:30 - 3:00 (Measurable Proof):** Flash the on-page **Live Eval Panel** showing extraction precision/recall against 10 ground-truth transcript snippets, closing on the Wispr Flow word-count dashboard.

---

```json
{
  "scores": [
    {
      "candidate": "C1",
      "user": 5.0,
      "investor": 5.0,
      "business": 6.0,
      "total30": 16.0,
      "hack100": 63,
      "feasibility": 8.5,
      "india_appeal": 5.0,
      "weakness": "Generic, forgettable Claude-like UI that lacks a visual hook, viral distribution narrative, or standout reason to exist."
    },
    {
      "candidate": "C2",
      "user": 8.0,
      "investor": 7.5,
      "business": 8.5,
      "total30": 24.0,
      "hack100": 93,
      "feasibility": 6.5,
      "india_appeal": 9.0,
      "weakness": "Infrastructure bloat risk (Neon pgvector + Resend + Vercel Cron) that could cause runtime failure during the tight 9.5-hour solo voice-dictated build."
    }
  ]
}
```
- See plan.md for the next version.
