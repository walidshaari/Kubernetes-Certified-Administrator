# Study method

A loop that turns reading into exam-speed skill. Use it for every topic.

## The loop

1. **Read the material once, properly.** Then close it.
2. **Attempt the lab blind**, without the material open. Use only kubernetes.io, like in the exam.
3. **Delete everything and redo it against the clock.**
4. **Break it on purpose, then fix it.** See [TROUBLESHOOTING.md](../TROUBLESHOOTING.md#4-the-break-and-fix-method).
5. **Log what happened** in the three notes files below.

Steps 4 and 5 are the first to get skipped when time is short, and they carry the most exam value. Protect them.

## A session that works

Plan in blocks, not clock times.

1. **Warm-up (short).** Re-run one command sequence from `commands.md` from memory. This is your spaced repetition.
2. **New material.** One topic.
3. **Blind attempt.**
4. **Timed redo.**
5. **Break it.** One deliberate fault, diagnosed out loud.
6. **Log.**

## Spaced repetition

Coming back to a topic a few days later is what makes it stick. A plan that crams everything into a short sprint trades retention for the feeling of progress. The warm-up in step 1 is the cheapest way to keep old topics alive.

## The three notes files

Copy the templates from [`templates/`](../templates/) into your own study repo.

| File | What goes in it |
|---|---|
| [`commands.md`](../templates/commands.md) | Command sequences that worked, ready to re-run |
| [`failures.md`](../templates/failures.md) | What broke, why, and the command that revealed it (symptom first) |
| [`docs-breadcrumbs.md`](../templates/docs-breadcrumbs.md) | Which kubernetes.io page has what, and the search term that finds it |

## Cross-check your sources

Third-party guides, blog posts and AI-generated notes often look right and are wrong at the edges (versions, flags, which component talks to which). Before you memorise something, check it against kubernetes.io or `kubectl explain`. See [MISCONCEPTIONS.md](MISCONCEPTIONS.md).
