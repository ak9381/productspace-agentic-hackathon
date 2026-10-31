USER: 6/10
INVESTOR: 5/10
BUSINESS: 7/10
TOTAL30: 18
HACK100: 71 (wispr 16/20, ux 15/20, ai 13/20, problem 10/15, linkedin 10/15, innovation 7/10)
NOVELTY: 5/8
ENDUSER: 4/8
MB1 transcript+speakers: yes — parses timestamped speaker lines with manual speaker renaming and accepts an oral Wispr debrief box.
MB2 decisions/actions/owners/deadlines: yes — Gemini extracts structured JSON with date-resolved deadlines, owners, and quotes verified against the source text.
MB3 conflict detection w/ memory: yes — fetches up to 20 past decisions via a 15-key taxonomy and classifies conflicts as new, confirms, refines, or contradicts.
MB4 tracker integration: yes — pushes confirmed action items directly to GitHub Issues with labels and source quotes via the API.
MB5 reminders: yes — triggers deadline emails via Resend using an hourly GitHub Action and daily Vercel cron targeting items due within 24 hours.
MB6 weekly digest per person: yes — provides a dedicated /digest/[person] route summarizing owned tasks, changes, and open objections with an email trigger.
MB7 confirmation step: yes — enforces a strict confirmation tray that blocks persistence and tracker exports until explicitly approved.
AGENTIC_CRITIQUE: This is not an autonomous multi-step agent; it is a deterministic pipeline and structured prompt chain branded as agentic. The "memory" is a basic relational lookup against a fragile 15-key taxonomy rather than an evolving, self-updating semantic knowledge graph. The "judgement" is a single classification prompt that routes downstream logic through rigid hardcoded UI branches instead of an adaptive planning loop. Tool execution (GitHub API, Resend) happens sequentially after human confirmation like a standard Zapier webhook, without autonomous tool selection, reflection, or self-correction. It functions as an intelligent document parser with conditional alerts, not an agent with genuine agency.
PROBLEM_CRITIQUE: It treats lost decisions as an accidental retrieval failure, completely ignoring that in 5–30 person Indian startups, decisions change intentionally through unrecorded WhatsApp chats, founder whims, and fluid customer conversations. Teams do not lack a courtroom ledger; they lack the discipline to manually paste transcripts, rename speakers, and adjudicate bureaucratic objections in fast-moving chaos. Forcing every pivot into a red "OBJECTION!" card creates social and operational friction for teams that survive by changing their minds weekly. Furthermore, restricting the execution tracker to GitHub Issues alienates non-technical founders, PMs, and agencies who actually live in Notion, Linear, ClickUp, or WhatsApp.
BIGGEST_WEAKNESS: Trying to build seven distinct mandatory modules, dual cron reminder pipelines, and an eval suite in nine hours via voice dictation invites crippling integration bugs that will ruin the live demo.
ONE_CHANGE: Scrap the fragile GitHub cron reminder infrastructure and the rigid 15-key taxonomy to focus solely on a bulletproof transcript-to-objection demo using semantic vector search and an instant mock WhatsApp alert.
