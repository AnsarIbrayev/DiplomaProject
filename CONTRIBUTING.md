# Repository Workflow

## Branches

| Branch | Purpose |
|---|---|
| `main` | Stable version, changed only through pull requests |
| `develop` | Ongoing development |
| `feature/<ID>-<description>` | New functionality, for example `feature/DOA-19-onboarding` |
| `fix/<ID>-<description>` | Bug fixes |
| `docs/<ID>-<description>` | Thesis text and documentation |

`<ID>` is the task ID in YouTrack.

## Commits

Format: `<type>(<area>): <description> [<ID>]`

| Type | When |
|---|---|
| `feat` | New functionality |
| `fix` | Bug fix |
| `docs` | Thesis text, README, documentation |
| `ml` | Models, datasets, experiments |
| `refactor` | Code improvement without a change in behavior |
| `test` | Tests |
| `chore` | Configuration, dependencies |

Examples:

```
feat(mobile): onboarding screen [DOA-19]
docs(thesis): chapter 1, literature review [DOA-5]
ml(rules): rule engine verification on synthetic profiles [DOA-23]
```

## Pull Requests

1. Create a branch from `develop`.
2. Open a pull request into `develop` and name the YouTrack task.
3. At least one review by a team member.
4. Merge after approval.
