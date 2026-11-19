# dotagents

Ready-made workflows and skills for coding agents. [Agents](https://github.com/alexec/Agents)
installs them in `~/.agents` the first time it starts, and you can also use them without
Agents.

The layout is the same as `~/.agents`:

- `workflows/<id>.md` is a workflow: front matter that says when it starts (an event or a
  schedule) and how its agent runs, and a prompt that says which skill to follow.
- `skills/<id>/SKILL.md` is a skill: the steps an agent follows. A workflow's skill has the
  workflow's id.

## Workflows

| Workflow | What it does |
|---|---|
| `address-review-comments` | Answers or fixes each open review comment on a pull request or merge request, on its own branch, and pushes. |
| `answer-a-sign-up-code` | Reads a sign-up or sign-in code from a mail from an allowed sender, and gives it to the session that waits for it. |
| `daily-checks` | Looks at the folders that had no work since the last check: failing CI, stale pull requests, issues with no session. |
| `file-a-bug-from-sentry` | Files a bug for a new or regressed Sentry issue, or comments on the issue that tracks it, with no secrets in it. |
| `fix-failed-checks` | Finds why a pull request's checks failed, fixes it on its branch and pushes, or runs the failed jobs again. |
| `work-a-jira-issue` | Does the work that a Jira issue asks for, and opens a pull request for it. |
| `work-a-linear-issue` | Does the work that a Linear issue asks for, and opens a pull request for it. |
| `work-an-issue` | Does the work that a GitHub or GitLab issue asks for, and opens a pull request or merge request for it. |

## Skills with no workflow

| Skill | What it does |
|---|---|
| `map-a-docs-server` | Writes the map of a docs MCP server's search and read tools (Confluence, Notion, Google Drive, a wiki), so its first search can prove it. |
| `start-a-new-app` | Takes a new app from the first question to its first approved deploy: the repository from a starter, the deploy gates, and the accounts. |

## Use them without Agents

Copy what you want into your own `~/.agents`, or into a project's `.agents`:

```sh
git clone https://github.com/agentloops-dev/dotagents
cp -R dotagents/skills/work-an-issue ~/.agents/skills/
cp dotagents/workflows/work-an-issue.md ~/.agents/workflows/
```

Any agent that reads skills can follow one. The skills name the tools of Agents
(`wait_for_event`, `make_app_repository`): with another runtime, use the tools it has.

## Versions

Each release of Agents pins one tag of this repository, and that tag's commit. A push here
changes nothing that a release installs. A newer version replaces a copy only when you did
not edit it, and it asks for your approval again. Tags are never moved.
