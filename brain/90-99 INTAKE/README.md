# 90-99 INTAKE

The agent working zone. All incoming material enters here before being routed.

## Subfolders

| Folder | Purpose |
|---|---|
| 90.01 Inbox/ | Human capture. Unprocessed items awaiting triage. |
| 90.02 Raw/ | Drop zone. Triggers agent watchers. Subfolders by type. |
| 90.03 Outbox/ | Agent output awaiting human approval before any external action. |
| 90.04 Assets/ | Final home for sorted, approved media and attachments. |

## Flow

1. File drops into `90.02 Raw/`.
2. Agent observes, orients against Intent.md, decides destination, acts, logs to Agent-Log.
3. If ambiguous or boundary-touching: escalates to `90.01 Inbox/`.
4. Agent drafts go to `90.03 Outbox/pending/`.
5. Human approves by moving to `90.03 Outbox/approved/`.
6. Only approved items trigger external actions.
