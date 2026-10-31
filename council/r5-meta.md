USER: 8/10
INVESTOR: 6/10
BUSINESS: 7/10
TOTAL30: 21
HACK100: 77 (wispr 17/20, ux 16/20, ai 14/20, problem 12/15, linkedin 11/15, innovation 7/10)
NOVELTY: 6/8
ENDUSER: 7/8
MB1 transcript+speakers: yes — parses [mm:ss] + Name: and forces rename once, not auto-diarization theatre
MB2 decisions/actions/owners/deadlines: yes — JSON extraction with quote-grounding, owner, deadline resolution, drops hallucinations
MB3 conflict detection w/ memory: yes — fetches 20 prior active decisions by topic key, classifies new/confirms/refines/contradicts with then-vs-now evidence
MB4 tracker integration: yes — confirmed actions → real GitHub Issues API with labels and quote link
MB5 reminders: partial — GitHub Actions hourly + Vercel cron + Resend is shippable, but it's polling email, not proactive agent nudging
MB6 weekly digest per person: yes — /digest/[person] with owns/changes/open objections + summary
MB7 confirmation step: yes — confirmation tray gate before save/post, verdict can be spoken
AGENTIC_CRITIQUE: This is not a true autonomous agent loop, it's a 3-step pipeline with retrieval. Step 1 parse, Step 2 extract, Step 3 classify against memory is a prompt chain with tools, not planning or self-correction. Memory is real though — fixed taxonomy + topic-key fetch + Zep/Graphiti-inspired temporal logic is more than vector RAG. The judgement is real: overrule/keep/flag with provenance is agentic decision-making. To pass judges: you need to show the tool use trace, not just final JSON.
PROBLEM_CRITIQUE: You actually get it. Decisions don't get lost because transcription is bad, they get lost because reversals are silent, owners are vague, and deadlines live in WhatsApp. You attacked the right disease: conflicting memory across meetings, not summary. The courtroom metaphor forces accountability — who said what, when. Miss: you ignore Indian startup reality where owner = "we'll do it" and deadline = "ASAP next week" — your resolver will break.
BIGGEST_WEAKNESS: GitHub Issues for non-engineering founder decisions is a fake tracker integration that kills adoption.
ONE_CHANGE: Swap GitHub as primary demo for Notion/linear tasks or kill GitHub and make the Objection Card the tracker itself with assignable verdict state.
