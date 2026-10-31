USER: 6/10
INVESTOR: 5/10
BUSINESS: 4/10
TOTAL30: 15
HACK100: 68 (wispr 17/20, ux 14/20, ai 11/20, problem 12/15, linkedin 8/15, innovation 6/10)
NOVELTY: 5/8
ENDUSER: 5/8
MB1 transcript+speakers: partial — paste + basic parser + one-time rename works for demos; no real ingestion, auto-attribution, or multi-meeting speaker persistence
MB2 decisions/actions/owners/deadlines: yes — structured JSON with quotes, resolved dates, drop-if-not-sourced is the right bar
MB3 conflict detection w/ memory: partial — topic-key fetch + Gemini classify + red card meets the letter; taxonomy is brittle and memory is flat rows, not temporal/graph
MB4 tracker integration: yes — real GitHub Issues API with labels and source quote is claimed
MB5 reminders: yes — hourly GH Actions + Vercel cron + Resend + log is specified
MB6 weekly digest per person: yes — /digest route with Gemini summary and email button is specified
MB7 confirmation step: yes — tray blocks save/post until ticked
AGENTIC_CRITIQUE: This is a linear prompt pipeline with a database lookup, not an agent. Parse → one Gemini extraction → fetch same-topic rows → second Gemini classify → user confirmation → post-hoc tool calls (GitHub, email). Memory is a simple table of decisions keyed by a fixed taxonomy; there is no retrieval planning, tool selection inside the reasoning loop, reflection, or multi-turn judgement. Classification is a single call that can be gamed or brittle. The "temporal agent memory" reference is marketing; the implementation is extract-then-compare. It is better than a chat box, but still a scripted chain that stops at the first contradiction instead of continuing to investigate or negotiate.
PROBLEM_CRITIQUE: It correctly names the pain (decisions evaporate, later calls silently reverse them) and correctly identifies cross-meeting memory + conflict detection as the differentiator from commodity summarizers. It does not get why they stay lost: teams already have Otter/Notion/WhatsApp and simply do not reopen them. Paste + rename + confirmation tray adds more friction on top of existing ignored notes. Speaker attribution by manual rename and a fixed 15-key taxonomy will break on real multi-person, multi-topic Indian startup calls. Accountability is cultural; a red stamp does not create the habit of checking before the next meeting.
BIGGEST_WEAKNESS: The full list of integrations, cron reminders, per-person digests, eval harness, custom courtroom UI, and seed memory cannot be built, tested, and deployed by one person in ~9 hours using only voice prompts, so the system will be incomplete and lose credit on the must-haves that matter.
ONE_CHANGE: Kill reminders, digests, and GitHub; ship only the Wispr debrief → cleaned structured decisions + topic-keyed memory that fires a live OBJECTION card on the seeded kickoff contradiction, so the one novel behaviour actually works on stage.
