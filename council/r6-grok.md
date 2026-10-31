USER: 6/10
INVESTOR: 4/10
BUSINESS: 3/10
TOTAL30: 13
HACK100: 48 (wispr 12/20, ux 10/20, ai 9/20, problem 10/15, linkedin 4/15, innovation 3/10)
NOVELTY: 5/8
ENDUSER: 5/8
MB1 transcript+speakers: partial — paste of pre-formatted Zoom/Meet text works; pure Wispr debrief is hero but speaker attribution on free speech is brittle and unproven under time pressure.
MB2 decisions/actions/owners/deadlines: yes — Gemini JSON extraction with quotes, timestamps, drop-unquotable is solid if the prompt is tight.
MB3 conflict detection w/ memory: partial — topic-key + classify new/confirms/refines/contradicts + red card is the core claim; agent loop adds steps but memory window + embedding fallback will be shallow and flaky in 9 h.
MB4 tracker integration: partial — ledger-as-tracker is clever and fast; Notion official API is real but auth, schema mapping, and error handling eat hours and can fail silently.
MB5 reminders: yes — GitHub Actions hourly + Resend + log + Send-now is standard and doable if the job is simple.
MB6 weekly digest per person: partial — /digest/[person] page is easy; true weekly scheduled email per person is stretch and likely cut.
MB7 confirmation step: yes — tray + explicit tick before anything posts is explicit and cheap.
AGENTIC_CRITIQUE: The bounded loop with four tools and a hard 5-step stop is a prompt chain wearing an agent costume. Gemini function calling + a logged trail looks agentic on the eval page, but search_memory (key → window → embedding) and verify_conflict are sequential lookups, not iterative judgement under uncertainty. Max 5 steps + deterministic fallback means the system never really reasons; it retrieves and classifies. Cross-meeting memory is the stated differentiator yet the agent has no durable, queryable state beyond what you hard-code in the taxonomy. Judges will see a nicer pipeline, not an agent that owns the problem.
PROBLEM_CRITIQUE: The real pain is not "we lack a better Otter." It is that decisions die in the gap between verbal agreement and someone else's calendar/Notion/WhatsApp, and nobody owns the follow-up. Your system extracts and flags contradictions after the fact; it does not force ownership, surface the cost of silence, or close the loop while people are still in the meeting. Topic keys and a courtroom ledger are aesthetic; they do not solve the political problem that the person who should have written it down already moved on. Memory without enforcement is just a prettier graveyard.
BIGGEST_WEAKNESS: The agent loop and Notion integration are both overbuilt for the remaining hours and under-deliver on the actual failure mode (decisions evaporating between meetings).
ONE_CHANGE: Freeze the agent to a single deterministic extract → memory lookup → classify path, drop Notion, and ship a one-click "post to WhatsApp group + pin in Notion via webhook" instead of a full database integration.
