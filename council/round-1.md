# Council round 1

## Scores

| Candidate | Claude /30 | agy /30 | Avg /30 | Claude /100 | agy /100 | Avg /100 |
|---|---|---|---|---|---|---|
| A | 19 | 12 | 15.5 | 66 | 53 | 59.5 |
| B | 21 | 20 | 20.5 | 79 | 90 | 84.5 |
| C | 18 | 26 | 22.0 | 79 | 93 | 86.0 |
| D | 17 | 16 | 16.5 | 73 | 74 | 73.5 |
| E | 17 | 15 | 16.0 | 70 | 70 | 70.0 |

## Prompt (identical to both judges, fresh session)

````
You are a harsh 3-persona judging council: (a) the TARGET USER of the product, (b) a seed-stage VC in India, (c) an experienced operator/PM who has shipped hackathon winners. Do not use tools or read files; answer from this prompt only. Be blunt.

EVENT: Product Space x Wispr Flow "Agentic AI Hackathon", online, India, Sat 31 Oct 2026. ~500 participants. Build starts ~1:30 PM IST, submission closes 11:59 PM IST today (~9.5 hours left). Builder: Akash, SOLO, competent developer, builds entirely by DICTATING prompts via Wispr Flow (voice-to-text) into Claude Code / Antigravity. Stack must deploy free and fast (e.g. Next.js on Vercel, or Render) with an LLM API (Gemini/Claude/OpenAI). Submission: deployed URL + test login, 2–3 min voiceover video, Wispr words-spoken screenshot. Must pick one of 5 official statements; no old projects.
RULE: the product's main input must be natural speech captured via Wispr Flow (Wispr types into the app's text box; the agent must turn fillers, digressions, self-corrections into clean structured output).
OFFICIAL RUBRIC /100: Wispr Flow usage (how voice was used to build AND use the product) 20; Prototype quality & UX 20 (judges said they are BORED of generic Claude-looking UIs); AI integration 20 (must be genuinely useful, not a chat box bolted on); Problem understanding 15 (cover the official must-build list); LinkedIn content & engagement 15; Innovation & creativity 10 (beyond one-prompt-one-response).
KILL RULES: not demoable live by deadline, no measurable proof it works, depends on blocked/paid-gated tools. Anything not buildable by 11:59 PM is PLAN and gets no credit.
Also judge "does each module actually help?" — feature bloat on paper is not rewarded.

ROUND 1 — five candidate concepts, one per official statement:

A. CLIPWALLAH (01 Media repurposing): creator pastes a podcast/YouTube URL (or transcript); app picks 5 clips with a reason each, writes platform-specific captions (Reels/Shorts/LinkedIn/X), a brand-voice memory that learns from the creator's edits (diffs stored as style rules), a content calendar, and a feedback loop where the creator enters views/likes and future picks re-weight. Voice: creator dictates the brief and edits. Buyer: Indian creators/agencies, Rs 999/mo. PLAN: real video cutting, platform analytics APIs.

B. CONCEPTMAP TUTOR (02 Exam prep): Class 10 CBSE physics (Light/Electricity) concept graph; 10-question diagnostic; Bayesian-ish mastery per concept; student SPEAKS their reasoning for each answer and the AI detects the specific misconception from that reasoning; targeted question generation with difficulty; spaced-repetition queue; teacher dashboard heatmap of class gaps with seeded students. Buyer: coaching centres, Rs 49/student/mo.

C. DECISION LEDGER (03 Meeting-to-execution): paste/dictate a meeting transcript with speakers; agent extracts decisions, action items, owners, deadlines; stores decisions in cross-meeting memory and flags CONFLICTS with earlier decisions ("on 24 Oct you decided launch = Nov 15, today Nov 30"); user confirms, then tasks are pushed to a real tracker (Trello/Linear/GitHub Issues API); deadline reminders (email/cron); weekly per-person digest. Voice: after a call you just ramble a voice debrief via Wispr and it becomes tasks. Demo data: the real hackathon kickoff transcript. Buyer: startup teams, Rs 299/seat/mo.

D. PAISA COACH (04 Finance): upload messy bank CSV/PDF + paste UPI/bank SMS; auto-categorize; user corrects a category by voice ("Swiggy is office food when it's weekday lunch") and a rule is learned; subscription detection with change/unused alerts; persistent profile + goals; what-if simulator by voice ("what if rent goes up 5k and I cut dining 30%") showing goal date shift; drift nudges; monthly review; guardrail refuses stock tips. Buyer: young Indian salaried users, freemium.

E. PIVOTPATH (05 Career pivot): upload resume + target role; scrape/paste 5 real JDs; skill-gap map; week-by-week plan; portfolio projects per gap; VOICE mock interview scored on a rubric; progress tracking that re-plans; application tracker learning which roles respond. Buyer: career switchers, Rs 499/mo.

For EACH candidate give: User /10, Investor /10, Business /10, Total /30; Hackathon /100 broken down by the official rubric (20/20/20/15/15/10); feasibility solo in ~9.5h (1-10); Indian-audience demo appeal (1-10); top 3 risks; biggest weakness; one change that would raise the /30 most. Then a final ranking table, your recommended track, and a sharper product concept for the winner with its differentiator and 30-second voice-to-action wow moment.
END WITH a fenced ```json block: {"scores":[{"candidate":"A","user":n,"investor":n,"business":n,"total30":n,"hack100":n,"feasibility":n,"india_appeal":n,"weakness":"..."} ... for A-E],"pick":"letter"}

````

## Raw answer: claude

# COUNCIL VERDICT — Agentic AI Hackathon, 9.5h solo, voice-built

Blunt frame before scores: the whole event lives or dies on **"messy speech → clean structure, live, with proof."** Any concept where the *primary* input is a file or URL and voice is a side-feature is structurally capped on the 20-point Wispr axis. Any concept with 6 modules in 9.5h solo is PLAN, and PLAN earns zero. Kill rules are a multiplier, not a footnote.

---

## A. CLIPWALLAH (Media repurposing)

- **User 8 / Investor 5 / Business 6 → /30 = 19**
- **Hackathon /100 = 66** — Wispr **11**/20 (primary input is a URL/transcript, voice is secondary — fatal for this rubric), UX **12**/20 (text clips look generic), AI **14**/20 (clip-picking is commoditized; brand-voice-from-edits is the one good idea), Problem **10**/15 (real cutting is PLAN, so you miss the core of "media repurposing"), LinkedIn **12**/15, Innovation **7**/10
- **Feasibility 6/10** · **India appeal 7/10**
- **Top 3 risks:** (1) real video cutting is PLAN → judges see text, not clips → "no measurable proof" kill-rule flirtation; (2) Wispr is bolted on, not central; (3) clip-selection output looks like every other LLM demo.
- **Biggest weakness:** voice isn't the main input, so you're fighting the single highest-leverage axis.
- **One change to raise /30 most:** make the creator's *spoken brief/edits* the engine — "no, cut the intro, punchier hook, less corporate" by voice updates the brand-voice memory live. Still won't fix the missing video.

## B. CONCEPTMAP TUTOR (Exam prep)

- **User 8 / Investor 6 / Business 7 → /30 = 21** (highest /30)
- **Hackathon /100 = 79** — Wispr **17**/20 (student *speaks reasoning* → AI names the specific misconception: this is a genuinely novel voice use), UX **14**/20 (concept graph + misconception reveal can look non-generic), AI **17**/20 (misconception detection is the real thing, not a chat box), Problem **12**/15 (broad must-build list → risk of covering it only shallowly), LinkedIn **11**/15, Innovation **8**/10
- **Feasibility 5/10** · **India appeal 9/10** (CBSE Class 10 + coaching centres = the most emotionally resonant audience in the room)
- **Top 3 risks:** (1) scope — graph + Bayesian mastery + targeted gen + spaced rep + teacher dashboard = 5 subsystems, most will end up seeded/faked → bloat penalty; (2) **measurable proof is soft** — how do you prove on stage the misconception call was *correct*? (3) if the graph is thin, it collapses to a quiz-with-explanations.
- **Biggest weakness:** too many modules; the one brilliant feature (speak-reasoning→misconception) is buried under edtech scaffolding you can't finish.
- **One change to raise /30 most:** **cut everything except the speak-reasoning → misconception → targeted next-question loop.** Make that one loop flawless with 3–4 hard-coded misconceptions per concept. It's the whole wow and it ships.

## C. DECISION LEDGER (Meeting-to-execution)

- **User 7 / Investor 5 / Business 6 → /30 = 18**
- **Hackathon /100 = 79** — Wispr **17**/20 (ramble a post-call debrief → clean decisions/owners/deadlines is the *textbook* expression of the rule), UX **13**/20 (danger: a list of action items IS the generic Claude UI — must be fixed), AI **17**/20 (cross-meeting memory + conflict flagging is real agentic value beyond one-shot), Problem **13**/15 (hits the must-build list cleanly), LinkedIn **11**/15, Innovation **8**/10
- **Feasibility 8/10** (pure text + LLM, GitHub Issues API is free and instant — no video, no graph, no parsing) · **India appeal 6/10** (builder/PM crowd — exactly who's in this room — but less mass-emotional)
- **Top 3 risks:** (1) output looks like a to-do list → UX axis tanks unless the Conflict Radar is the visual hero; (2) tracker push: pick **GitHub Issues only** — Trello/Linear OAuth setup will eat 2 hours you don't have; (3) conflict detection must fire *reliably* on the demo transcript — rehearse it.
- **Biggest weakness:** on paper it's "another meeting-notes tool"; the conflict memory is the only thing separating it from a hundred Otter clones — so lead with it, don't bury it.
- **One change to raise /30 most:** reposition from "transcriber" to **"decision conscience"** — kill the weekly digest and reminders cron (unshippable polish), spend that time making Conflict Radar unmissable.

## D. PAISA COACH (Finance)

- **User 7 / Investor 5 / Business 5 → /30 = 17**
- **Hackathon /100 = 73** — Wispr **13**/20 (voice correction + what-if sim are lovely, but primary input is a CSV/PDF → voice is secondary), UX **13**/20, AI **15**/20 (categorization + learned rules + what-if sim genuinely useful; stock-tip guardrail is a smart judge-pleaser), Problem **13**/15, LinkedIn **12**/15, Innovation **7**/10
- **Feasibility 5/10** · **India appeal 9/10** (most relatable consumer pain in the room)
- **Top 3 risks:** (1) **bank CSV/PDF parsing is a fragility sinkhole** — one bad statement format and the demo dies; (2) Wispr not central; (3) 6 modules in 9.5h = PLAN.
- **Biggest weakness:** the file-parsing dependency is the highest-variance thing you could pick for a timed solo build.
- **One change to raise /30 most:** make **voice the primary input** — dictate transactions and corrections, pre-clean the demo CSV, and make the **voice what-if simulator** ("rent up 5k, dining down 30% → goal slips 4 months") the centerpiece.

## E. PIVOTPATH (Career pivot)

- **User 7 / Investor 5 / Business 5 → /30 = 17**
- **Hackathon /100 = 70** — Wispr **13**/20 (voice mock interview is the real moment; rest is upload-driven), UX **12**/20, AI **14**/20, Problem **11**/15 (sprawling list, likely partial), LinkedIn **13**/15 (career content performs on LinkedIn), Innovation **7**/10
- **Feasibility 6/10** · **India appeal 7/10**
- **Top 3 risks:** (1) resume + JDs + skill map + plan + mock + tracker = far too much; (2) voice is only in the mock interview, not the spine; (3) skill-gap mapping is generic LLM output judges have seen 50 times.
- **Biggest weakness:** the good part (voice mock interview, rubric-scored) is one feature inside a bloated product.
- **One change to raise /30 most:** ship **only the voice mock interview** — speak answers, get rubric-scored feedback with the specific weak competency and a re-ask. That alone is a sharper product than the whole thing half-built.

---

## FINAL RANKING

| Rank | Candidate | /30 | Hack/100 | Feasibility | India | Verdict |
|---|---|---|---|---|---|---|
| **1** | **C — Decision Ledger** | 18 | **79** | **8** | 6 | Safest high-ceiling ship; purest Wispr fit |
| 2 | B — ConceptMap Tutor | **21** | **79** | 5 | **9** | Best business/appeal, but scope will bite |
| 3 | D — Paisa Coach | 17 | 73 | 5 | 9 | Relatable but parsing is a landmine |
| 4 | E — PivotPath | 17 | 70 | 6 | 7 | One good feature, too much around it |
| 5 | A — ClipWallah | 19 | 66 | 6 | 7 | Voice isn't the input; video is PLAN |

**C and B tie on raw hack/100.** The tiebreak is the kill rules: in 9.5 solo hours by voice, C *ships a complete, measurable, non-faked loop* with near-certainty; B almost certainly ships as 60%-built scaffolding with a soft proof story. Feasibility is the multiplier. **I recommend Track C.** (If Akash's gut is edtech, run B — but only the stripped loop in B's "one change," nothing else.)

---

## RECOMMENDED TRACK: C — reframed as **"DECISION CONSCIENCE"**

**Not a meeting-notes app. An agent that remembers every decision your team made and interrupts you the moment you contradict one.**

**Scope to exactly this (and nothing else):**
1. Dictate a messy post-call debrief via Wispr Flow (fillers, "um", self-corrections included).
2. Agent cleans it and extracts `Decision / Action item / Owner / Deadline`.
3. **Conflict Radar** checks each against cross-meeting memory and flags contradictions with the prior decision, the date, and the delta.
4. One confirm → a real **GitHub Issue** is created, assigned, with due date. (GitHub Issues API only — free, instant, visually impressive.)

**Differentiator:** every competitor turns speech *into* a list. This one turns speech into a list *and argues back* — it's the only entry demonstrating persistent agentic memory that changes the output of a later interaction. That's the direct answer to "beyond one-prompt-one-response" (Innovation 10) and "not a chat box bolted on" (AI 20).

**UX fix (protects the 20-point UX axis):** do NOT render a plain checklist. The hero is a red **Conflict Radar** card with a two-column "then vs now" diff and a timeline spine of past decisions. That's what makes it not look like a Claude default.

**Measurable proof (kills the kill-rule):** the live GitHub Issue URL, created on stage. Seed memory with the **real hackathon kickoff transcript** — the meta-demo ("I fed this hackathon's own kickoff call into it") is gold for the LinkedIn axis and flatters the judges.

**30-second voice-to-action wow moment:**
> Akash speaks, rambling: *"Okay so, um, about launch — yeah I think we're pushing it, let's say Nov 30 now, and Priya's taking the landing page."*
> The app instantly cleans it → `Decision: Launch = Nov 30 · Owner: Priya → Landing page`.
> A red card fires: **"⚠️ Conflict — on 24 Oct this team decided Launch = Nov 15. You just moved it +15 days. Confirm the change?"**
> He says *"yes, confirm."* One click. A **live GitHub Issue** appears: *"Launch (moved Nov 15 → Nov 30)," assigned to Priya, due 30 Nov.*
> Rambling speech → caught contradiction → real tracked task, in under 30 seconds.

**Time budget (9.5h):** ~1h scaffold Next.js on Vercel + Gemini/Claude key · 3h extract+clean prompt and structured output · 2.5h cross-meeting memory + conflict detection · 1.5h Conflict Radar UI + timeline · 1h GitHub Issues push · 0.5h seed demo + rehearse the wow. Cut reminders-cron and weekly digest — they're unshippable polish and add nothing to the live demo.

```json
{"scores":[{"candidate":"A","user":8,"investor":5,"business":6,"total30":19,"hack100":66,"feasibility":6,"india_appeal":7,"weakness":"Voice is not the main input (URL/transcript is) and real video cutting is PLAN — caps the Wispr axis and risks the no-proof kill rule."},{"candidate":"B","user":8,"investor":6,"business":7,"total30":21,"hack100":79,"feasibility":5,"india_appeal":9,"weakness":"Five subsystems in 9.5h — the brilliant speak-reasoning->misconception loop gets buried under graph/dashboard/spaced-rep you can't finish, and proof-of-correctness is soft."},{"candidate":"C","user":7,"investor":5,"business":6,"total30":18,"hack100":79,"feasibility":8,"india_appeal":6,"weakness":"On paper it's 'another meeting-notes tool'; only the cross-meeting Conflict Radar differentiates it, so burying it behind a generic action-item list kills the UX and innovation axes."},{"candidate":"D","user":7,"investor":5,"business":5,"total30":17,"hack100":73,"feasibility":5,"india_appeal":9,"weakness":"Primary input is a bank CSV/PDF (voice secondary) and statement parsing is a high-variance sinkhole that can break the live demo."},{"candidate":"E","user":7,"investor":5,"business":5,"total30":17,"hack100":70,"feasibility":6,"india_appeal":7,"weakness":"The one strong voice feature (rubric-scored mock interview) is one module inside a sprawling upload-driven product that won't fully ship."}],"pick":"C"}
```

## Raw answer: agy

### Council Overview & Persona Lenses

* **Persona A (The Target User):** Pragmatic, impatient, and allergic to extra steps. *"Does this save me 30 minutes today without demanding homework, or does it feel like another chore I abandon by Tuesday?"*
* **Persona B (The Seed-Stage India VC):** Cynical about Indian Willingness-To-Pay (WTP), wary of thin LLM wrappers that die when OpenAI or Claude drops a feature, and obsessed with distribution moats.
* **Persona C (The Veteran Operator/PM):** 9.5-hour hackathon execution hawk. *"Can a solo dev dictate this into Vercel and ship a functioning URL before 11:59 PM, or will you be debugging PDF parsers, video codecs, or OAuth tokens while the submission form closes?"*

---

### Candidate Evaluations

---

#### A. CLIPWALLAH (01 Media Repurposing)
*A podcast/YouTube link-to-reels repurposer with platform-specific captions, brand-voice diff memory, content calendar, and engagement feedback loop.*

* **Target User Score:** **5/10** — *“If it doesn’t cut and export actual MP4 clips with hardcoded captions, it’s just a glorified text summarizer. Reading timestamps and manually clipping them in Premiere is still 90% of my work.”*
* **India VC Score:** **3/10** — *“Red ocean. OpusClip, Munch, and Klap already exist with VC war chests. Indian creators refuse to pay ₹999/mo for text suggestions when cracked tools and cheap video interns in Tier-2 cities cost the same.”*
* **Operator/PM Score:** **4/10** — *“‘PLAN: real video cutting’ is a lethal self-own. In a hackathon, an unbuilt ‘PLAN’ module scores 0. You are pitching a YouTube transcript parser that outputs text cards.”*
* **Total Viability Score:** **12/30**

##### Hackathon Rubric Breakdown (/100)
* **Wispr Flow Usage (20):** **10/20** — Dictating a brief is secondary; the primary input is a pasted YouTube URL, violating the core spirit of voice-first interaction.
* **Prototype Quality & UX (20):** **9/20** — Text cards and calendars on a screen; without real video previews, it looks like a boilerplate Tailwind dashboard.
* **AI Integration (20):** **11/20** — Standard multi-prompt chain (transcript -> clip detection -> caption). Low technical depth.
* **Problem Understanding (15):** **9/15** — Avoids the actual hard part of repurposing (audio diarization, framing, video rendering).
* **LinkedIn Content & Engagement (15):** **11/15** — Creators relate to it, but the concept is stale.
* **Innovation & Creativity (10):** **3/10** — Copy of 50 existing SaaS tools.
* **Total Hackathon Score:** **53/100**

* **Feasibility Solo in ~9.5h:** **7/10** (Text-only is easy to build; rendering video in 9 hours is impossible).
* **Indian-Audience Demo Appeal:** **5/10** (Over-saturated).
* **Top 3 Risks:**
  1. Judges disqualify it immediately under the kill rule because video cutting is marked as "PLAN".
  2. YouTube scraping/transcript APIs get rate-limited or blocked on serverless IP ranges during live testing.
  3. Indistinguishable from dozens of generic Claude prompt wrappers.
* **Biggest Weakness:** The value proposition collapses without real video rendering; text summaries of video clips feel completely hollow in a live demo.
* **One Change to Raise /30 Most:** Drop automated clipping entirely. Pivot to a **"Voice-over Director"**: you watch a raw video, talk through it in real time (*"cut here, zoom in on his face, make this soundbite snappy"*), and Wispr compiles your commentary into an automated XML/EDL timeline file for Premiere/CapCut.

---

#### B. CONCEPTMAP TUTOR (02 Exam Prep — CBSE Class 10 Physics)
*Light & Electricity interactive concept graph with diagnostic assessment, verbal reasoning misconception detector, dynamic difficulty generation, and class heatmap.*

* **Target User Score:** **8/10** — *“Class 10 students dread electricity numericals and ray diagrams. Being able to explain my logic aloud instead of typing math formulas on a phone keyboard is a massive relief.”*
* **India VC Score:** **6/10** — *“Indian parents pay aggressively for 10th Board exam outcomes. ₹49/student/mo to coaching centers is too low—coaching institutes will stall on B2B sales cycles, but B2C direct-to-parent with board guarantees has a real wedge.”*
* **Operator/PM Score:** **8/10** — *“Visually standout. An interactive React Flow graph showing misconception nodes turning from red to green in real time blows generic Claude-like chat boxes out of the water.”*
* **Total Viability Score:** **22/30**

##### Hackathon Rubric Breakdown (/100)
* **Wispr Flow Usage (20):** **19/20** — Voice reasoning is pedagogical gold: analyzing verbal pauses, fillers, and half-formed intuition to detect *why* a student thinks $V = I/R$ instead of $V = IR$.
* **Prototype Quality & UX (20):** **18/20** — An interactive node-based concept graph breaks completely away from standard chat UI fatigue.
* **AI Integration (20):** **18/20** — Structured classification matching student speech against pre-seeded pedagogical misconception trees.
* **Problem Understanding (15):** **14/15** — Razor-sharp CBSE syllabus alignment; tightly scoped to Light & Electricity.
* **LinkedIn Content & Engagement (15):** **13/15** — Screen recordings of an interactive physics graph reacting to voice make for viral hackathon demo clips.
* **Innovation & Creativity (10):** **8/10** — Voice-driven diagnostic assessment is a novel application beyond generic quiz bots.
* **Total Hackathon Score:** **90/100**

* **Feasibility Solo in ~9.5h:** **7/10** (Building a reactive node graph and diagnostic loop in 9.5 hours requires tight discipline: stick to static pre-seeded nodes, do not generate the graph dynamically from scratch).
* **Indian-Audience Demo Appeal:** **9/10** (Every Indian judge, builder, and parent has personal trauma from CBSE Class 10 Light and Electricity).
* **Top 3 Risks:**
  1. Time sink: Getting bogged down in node layout libraries (React Flow/Cytoscape) styling instead of the voice loop.
  2. Over-engineering Bayesian mastery formulas instead of simple deterministic heuristic scoring.
  3. Audio transcript latency breaking the rhythm of an interactive oral exam.
* **Biggest Weakness:** Trying to build the teacher dashboard heatmap and spaced repetition in the same 9.5 hours will dilute the student's voice-reasoning "aha" moment.
* **One Change to Raise /30 Most:** Ruthlessly eliminate the teacher dashboard and spaced-repetition queue. Focus 100% on a 3-question live oral viva where the student's spoken answer flips a red "Ohm's Law Misconception" node to green on the live graph.

---

#### C. DECISION LEDGER (03 Meeting-to-Execution)
*A meeting transcript and voice debrief analyzer that extracts decisions, checks cross-meeting memory for contradictions, pushes tasks directly to Linear/GitHub, and flags deadlines.*

* **Target User Score:** **9/10** — *“I spend 6 hours on Google Meet, finish with zero energy to write documentation, and spend next Monday arguing about whether we agreed on Nov 15 or Nov 30. A 60-second voice dump that catches conflicts and auto-creates Linear issues saves my sanity.”*
* **India VC Score:** **8/10** — *“High WTP. ₹299-₹999/seat/mo is standard SaaS spend for tech companies. Decision conflict detection is an actual defensible data asset rather than a simple summarization wrapper.”*
* **Operator/PM Score:** **9/10** — *“Matches the hackathon context perfectly. The judges are PMs and operators. You can use the official hackathon kickoff transcript as your live demo data. Fast execution: Next.js + Linear API personal access token + Claude structured outputs.”*
* **Total Viability Score:** **26/30**

##### Hackathon Rubric Breakdown (/100)
* **Wispr Flow Usage (20):** **19/20** — Ideal showcase: natural, rambling spoken debriefs filled with self-corrections (*"Let's ship on Friday... actually wait, make it Monday because testing isn't done"*) cleanly resolved into immutable decisions and task parameters.
* **Prototype Quality & UX (20):** **18/20** — Split-screen workspace: Left side is the historical timeline with bold amber conflict banners; right side is the staged Linear task queue with an instant push animation.
* **AI Integration (20):** **19/20** — Multi-step agentic evaluation: structured extraction -> entity matching against previous meeting state -> contradiction audit -> tool-calling dispatch to real trackers.
* **Problem Understanding (15):** **15/15** — Solves real meeting decay and accountability loss without demanding manual administrative overhead.
* **LinkedIn Content & Engagement (15):** **14/15** — Running the hackathon's own kickoff transcript through it to spot organizational contradictions is an instant viral hook.
* **Innovation & Creativity (10):** **8/10** — Shifting the paradigm from passive meeting transcription to active cross-meeting decision reconciliation.
* **Total Hackathon Score:** **93/100**

* **Feasibility Solo in ~9.5h:** **9/10** (No complex WebAssembly, no video decoding, no messy PDF scraping. Pure JSON data pipelines, basic embeddings or deterministic matching, and straightforward API pushes).
* **Indian-Audience Demo Appeal:** **8.5/10** (Every startup founder and tech lead in Bengaluru and Gurgaon battles meeting fatigue and tracking drift).
* **Top 3 Risks:**
  1. Getting trapped in OAuth authentication flows (must use direct Personal Access Tokens for Linear/GitHub).
  2. Hallucinating false-positive conflicts on ambiguous language.
  3. Demo looking like a standard meeting notes tool if the conflict-detection alert isn't visually striking.
* **Biggest Weakness:** Without a visually punchy conflict alert, judges might glance at it and mistake it for just another Otter.ai or Fireflies clone.
* **One Change to Raise /30 Most:** Introduce an unmissable visual **"Contradiction Alert" modal** with a diff view showing exact side-by-side quotes: *Oct 24: "Launch is Nov 15"* vs. *Today: "Launch is Nov 30"*, complete with a 1-click voice resolution trigger.

---

#### D. PAISA COACH (04 Personal Finance)
*Messy bank CSV/SMS parsing, voice-driven category rule tuning, subscription tracking, and a voice-powered what-if simulator tied to financial goals.*

* **Target User Score:** **7/10** — *“I want to track where my money goes, and telling my phone 'Swiggy on weekdays is work lunch' is way easier than tapping through menus. But I hate manually exporting bank statements.”*
* **India VC Score:** **5/10** — *“Indian consumer fintech B2C personal finance management (PFM) is a graveyard. CRED, Fold, and Jupiter have spent tens of millions trying to monetize PFM and failed. Indians do not pay for budget tracking software.”*
* **Operator/PM Score:** **4/10** — *“Fatal technical risk: Parsing Indian bank CSVs and password-protected PDFs (HDFC, ICICI, SBI) will swallow 5 hours of your 9.5-hour build window in regex debugging. You will hit a wall at 7 PM.”*
* **Total Viability Score:** **16/30**

##### Hackathon Rubric Breakdown (/100)
* **Wispr Flow Usage (20):** **15/20** — Voice category corrections and what-if queries are functional, but the heavy lifting starts with a messy text file upload.
* **Prototype Quality & UX (20):** **14/20** — Standard financial dashboard with metric cards and expense graphs.
* **AI Integration (20):** **15/20** — Categorization heuristics plus basic arithmetic forecasting models.
* **Problem Understanding (15):** **13/15** — Understands Indian UPI and SMS dynamics, but underestimates raw data ingestion friction.
* **LinkedIn Content & Engagement (15):** **11/15** — Personal finance tips are relatable, but PFM demos rarely spark excitement among technical judges.
* **Innovation & Creativity (10):** **6/10** — "Mint with a voice assistant" is a standard prompt engineering exercise.
* **Total Hackathon Score:** **74/100**

* **Feasibility Solo in ~9.5h:** **4/10** (Guaranteed time sink: PDF parsers, irregular bank CSV formats, and balance reconciliation edge cases).
* **Indian-Audience Demo Appeal:** **8/10** (UPI transaction fatigue resonates broadly).
* **Top 3 Risks:**
  1. Bank statement parsers crash live on stage due to unpredictable date or currency formats.
  2. Fall into the trap of feature bloat (PDFs, SMS, subscriptions, simulator, guardrails).
  3. Regulatory/hallucination risk if the model accidentally dispenses bad investment advice during a live test.
* **Biggest Weakness:** Bank statement ingestion will consume your remaining hackathon hours, leaving you with zero time to polish the voice UX.
* **One Change to Raise /30 Most:** Drop all PDF and CSV file uploads. Reposition it as **"UPI Voice Auditor"**: paste raw Android notification SMS text, and dictate voice rules live (*"Split last night's ₹1,400 Zomato charge across 3 roommates and log it"*).

---

#### E. PIVOTPATH (05 Career Pivot)
*Resume vs. target JDs skill-gap mapper, week-by-week curriculum generator, project recommender, voice mock interview scorer, and application tracker.*

* **Target User Score:** **6/10** — *“I don't need another generic 12-week study plan generated by an LLM that I'll abandon after two days. I need to know why my resume isn't getting callbacks and how to fix my specific gaps.”*
* **India VC Score:** **4/10** — *“Episodic product with high churn. Once someone switches jobs, they unsubscribe immediately. The space is saturated with hundreds of career/resume coaches built on top of GPT-4.”*
* **Operator/PM Score:** **5/10** — *“Massive feature bloat. Resume parsing + JD scraping + curriculum builder + voice mock interview + job tracker in 9.5 hours means all five modules will be shallow, brittle, and unconvincing.”*
* **Total Viability Score:** **15/30**

##### Hackathon Rubric Breakdown (/100)
* **Wispr Flow Usage (20):** **14/20** — The mock interview uses voice, but the rest of the application is standard form-filling and static text tables.
* **Prototype Quality & UX (20):** **13/20** — Markdown tables and generic progress bars. Highly vulnerable to looking like a template Claude UI.
* **AI Integration (20):** **14/20** — Standard text-diff analysis between resume strings and job description strings.
* **Problem Understanding (15):** **12/15** — Attempts to tackle the entire career transition pipeline instead of nailing one high-friction bottleneck.
* **LinkedIn Content & Engagement (15):** **12/15** — Popular topic on LinkedIn, but oversaturated to the point of audience fatigue.
* **Innovation & Creativity (10):** **5/10** — One of the most common hackathon project templates since late 2023.
* **Total Hackathon Score:** **70/100**

* **Feasibility Solo in ~9.5h:** **5/10** (Scraping live job descriptions will trigger bot defenses/CORS blocks; building an end-to-end voice interview loop eats massive debugging time).
* **Indian-Audience Demo Appeal:** **7/10** (Engineers seeking career pivots are common, but skeptical of automated advice).
* **Top 3 Risks:**
  1. Live web scraping of job boards (LinkedIn, Naukri) breaks completely due to Cloudflare/anti-bot protection.
  2. Voice latency in the mock interview makes dialogue awkward and unconvincing.
  3. Overloaded scope results in half-rendered placeholders across the dashboard.
* **Biggest Weakness:** Feature sprawl: trying to be a scraper, coach, curriculum designer, and interviewer all at once, resulting in zero stand-out capabilities.
* **One Change to Raise /30 Most:** Delete the roadmaps, scrapers, and application tracker. Build only **"The 3-Minute Brutal Voice Screener"**: paste one JD, dictate your background, and let a harsh AI hiring manager interview you on your biggest vulnerability.

---

### Comparative Evaluation Table

| Candidate | Track | Target User (/10) | India VC (/10) | Operator (/10) | Total Viability (/30) | Hackathon Score (/100) | Feasibility (1-10) | India Appeal (1-10) | Kill-Rule Exposure |
| :--- | :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| **A. Clipwallah** | 01 Media | 5 | 3 | 4 | **12** | **53** | 7 | 5 | **HIGH** (Video cut is "PLAN") |
| **B. ConceptMap** | 02 EdTech | 8 | 6 | 8 | **22** | **90** | 7 | 9 | **MED** (Graph UX scope creep) |
| **C. Decision Ledger**| **03 Execution**| **9** | **8** | **9** | **26** | **93** | **9** | **8.5** | **LOW** (Clean data APIs) |
| **D. Paisa Coach** | 04 Finance | 7 | 5 | 4 | **16** | **74** | 4 | 8 | **HIGH** (PDF/CSV parsing hell) |
| **E. PivotPath** | 05 Career | 6 | 4 | 5 | **15** | **70** | 5 | 7 | **HIGH** (Scraping & feature bloat)|

---

### Final Verdict & Recommendation

#### The Pick: **C. DECISION LEDGER (Track 03 — Meeting-to-Execution)**

**Why it wins:**
1. **Audience Alignment:** The host is *Product Space* and the partner is *Wispr Flow*. The judges and audience are product managers, engineering leads, and startup builders who deal with alignment debt, meeting sprawl, and Linear ticket maintenance every single day.
2. **Zero Feasibility Traps:** It avoids video encoding pipelines (A), graph engine math headaches (B), bank statement formatting hell (D), and web-scraping bot barriers (E). It relies on clean JSON data structures, fast vector/text similarity matching, and a direct Linear API integration that can be wired up in under 30 minutes with a Personal Access Token.
3. **Flawless Wispr Showcase:** Voice is not bolted on as an afterthought. It directly exploits the natural behavior of voice dictation: fast, unstructured, messy brain dumps filled with contradictions and real-time corrections that the agent parses into pristine, auditable operations.

---

### Sharpened Product Blueprint: "ARBITER" (Decision Ledger)

#### The Differentiator
Most meeting tools generate generic, unstructured "meeting minutes" that disappear into Google Docs to die. **Arbiter** is an active operational gatekeeper: it treats past team decisions as an immutable ledger and acts as a contradiction auditor. If today's spoken consensus violates a decision made last week, Arbiter rings an alarm, stages the conflict for reconciliation, and refuses to let misaligned work enter the engineering tracker.

#### The 30-Second Voice-to-Action "Wow Moment" (Live Demo Script)

1. **00:00 - 00:05:** Screen shows Arbiter's dashboard. In the historical memory column, an existing entry is visible: *"Sprint Sync Oct 24: Launch Date locked for Nov 15. Primary DB: DynamoDB."*
2. **00:05 - 00:15:** Akash activates Wispr Flow and dictates a realistic, messy 30-second post-call brain dump:
   > *"Hey Arbiter, debrief from quick sync with Rohan. We're locking the launch date to November 30th because frontend isn't ready. Also, task for Rohan: set up PostgreSQL schema by next Tuesday, high priority. Oh wait, actually scratch Tuesday, give him until Thursday at 5 PM because he's on call."*
3. **00:15 - 00:22 (The Processing Magic):**
   * The text box shows the raw spoken transcript with all fillers and mid-sentence corrections.
   * Arbiter executes the parse: it resolves the date correction (Thursday 5 PM, not Tuesday), extracts Rohan's assignment, and matches the update against memory.
4. **00:22 - 00:30 (The Visual Climax):**
   * **Visual 1 (Conflict Flash):** A high-contrast Amber Conflict Banner slides into view:
     > `⚠️ CONTRADICTION DETECTED: Today's spoken launch date (Nov 30) directly contradicts Oct 24 Decision (Nov 15). Click to Overwrite or Flag for Leadership.`
   * **Visual 2 (Execution Dispatch):** Below the banner, a clean, structured Linear card appears: `[PROD-104] Set up PostgreSQL schema | Assignee: Rohan | Due: Thursday 5 PM | Priority: High`.
   * Akash clicks **"Sync"**: a green toast notification confirms: *Pushed to Linear via API*. Live issue link opens instantly in a new tab.

---

```json
{
  "scores": [
    {
      "candidate": "A",
      "user": 5,
      "investor": 3,
      "business": 4,
      "total30": 12,
      "hack100": 53,
      "feasibility": 7,
      "india_appeal": 5,
      "weakness": "Core value proposition of real video clipping is punted to an unbuilt PLAN, turning the app into a generic text summarizer in a crowded market."
    },
    {
      "candidate": "B",
      "user": 8,
      "investor": 6,
      "business": 6,
      "total30": 20,
      "hack100": 90,
      "feasibility": 7,
      "india_appeal": 9,
      "weakness": "High risk of scope creep in graph visualization and pedagogical math during a tight 9.5-hour build window."
    },
    {
      "candidate": "C",
      "user": 9,
      "investor": 8,
      "business": 9,
      "total30": 26,
      "hack100": 93,
      "feasibility": 9,
      "india_appeal": 8.5,
      "weakness": "Risks blending in as another standard meeting note taker if the decision contradiction engine is not front-and-center in the UI."
    },
    {
      "candidate": "D",
      "user": 7,
      "investor": 5,
      "business": 4,
      "total30": 16,
      "hack100": 74,
      "feasibility": 4,
      "india_appeal": 8,
      "weakness": "Parsing inconsistent Indian bank CSVs and password-protected PDFs under hackathon time constraints is an engineering death trap."
    },
    {
      "candidate": "E",
      "user": 6,
      "investor": 4,
      "business": 5,
      "total30": 15,
      "hack100": 70,
      "feasibility": 5,
      "india_appeal": 7,
      "weakness": "Unfocused feature sprawl across the career funnel coupled with fragile live job-board scraping dependencies."
    }
  ],
  "pick": "C"
}
```
- See plan.md for the next version.
