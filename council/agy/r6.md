USER: 7/10
INVESTOR: 6/10
BUSINESS: 6/10
TOTAL30: 19
HACK100: 81 (wispr 18/20, ux 16/20, ai 17/20, problem 12/15, linkedin 10/15, innovation 8/10)
NOVELTY: 6/8
ENDUSER: 5/8
MB1 transcript+speakers: yes — Ingests Zoom/Meet/Wispr format with speaker-timestamp tagging and offers the 30-second spoken debrief box.
MB2 decisions/actions/owners/deadlines: yes — Strict schema extracts quotes, owners, dates, and strike-through self-corrections while dropping unquotables.
MB3 conflict detection w/ memory: yes — Embeddings and ~15-key taxonomy compare against prior decisions, triggering the red "OBJECTION!" card.
MB4 tracker integration: partial — Courtroom ledger functions as the internal tracker with one live Notion API sync, but Notion OAuth/token plumbing in 9 hours is a major failure point.
MB5 reminders: partial — GitHub Actions cron triggering `/api/reminders` with Resend works on paper, but email DNS/domain warming and external runner cron setup burn critical hackathon minutes.
MB6 weekly digest per person: yes — `/digest/[person]` directly renders filtered owned tasks, recent status changes, and open objections.
MB7 confirmation step: yes — Explicit staged confirmation tray isolates all decisions and tracker exports until individually ticked.
AGENTIC_CRITIQUE: The tool-equipped loop (`search_memory`, `verify_conflict`, `ask_clarifying_question`, `queue_action`) qualifies as an agent because the model orchestrates when to inspect history and autonomously executes a second verification pass before taking state-altering actions. The live reasoning trail and deterministic extraction fallback demonstrate mature engineering, proving this is an active decision agent rather than a passive single-prompt summarizer. However, capping the loop at 5 steps in a high-latency API environment means tool calls could time out during a live demo, frequently kicking you down into the fallback. If your judges see the fallback run instead of the dynamic reasoning trail, the agentic illusion collapses immediately.
PROBLEM_CRITIQUE: You correctly identify that decisions are lost to social cowardice, context fragmentation, and silent drift rather than an absence of note-taking software. Externalizing the tension to an AI ("OBJECTION!") solves the real human dynamic where team members avoid confrontation over reversed mandates. However, you miss the core adoption reality of Indian startups: founders and PMs do not maintain hygiene, and manual transcript copy-pasting or post-call voice debriefing dies within 48 hours. If the product requires conscious user initiation after every meeting instead of passive interception, it will suffer the same fate as the unread Notion docs it tries to replace.
BIGGEST_WEAKNESS: Integrating the Notion API, configuring GitHub Actions cron, and debugging live Resend delivery will burn three of your nine remaining hours on commoditized plumbing that earns zero extra judge points.
ONE_CHANGE: Mock the external Notion and cron infrastructure behind a one-tap manual trigger to freeze code by 6:30 PM, guaranteeing you three full hours to record the demo video and drive LinkedIn engagement.
