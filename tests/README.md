# Tests

Automated tests live next to the component they test:

| Component | Location | Run | Status |
|---|---|---|---|
| Mobile client (Flutter prototype) | [`mobile/test/`](../mobile/test/) | `cd mobile && flutter test` | Rule, widget and localization tests for the prototype (DOA-11) |
| Backend (FastAPI) | `backend/tests/` | `pytest` | Planned, DOA-17 and DOA-18 |
| Rule-base verification on 200 synthetic profiles (SQ1) | `ml/` | `pytest` | Planned, DOA-23 |

This folder holds cross-component test materials: acceptance test cases for Must requirements (level A of the [evaluation plan](../docs/evaluation/evaluation-plan.md), DOA-28) and usability test materials (level C, DOA-29). It is empty until those tasks start.
