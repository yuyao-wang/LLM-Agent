# Commit-to-Contribution Map

This table maps my commits in this fork to concrete, inspectable artifacts.

| Commit | Date (YYYY-MM-DD) | Evidence | Interpreted contribution |
|---|---|---|---|
| `5f2745b7` | 2025-10-03 | Added `data/*.json`, `examples/train_lora/*.yaml`, `examples/merge_lora/*.yaml`, `docker/docker-cuda/*`, logs (`train.out`, `trainQwen.out`, `ltrain_log`) | Core early-stage contribution: data assembly, baseline training configs, and experiment execution artifacts for tool-calling agent SFT. |
| `a43e48e7` | 2025-10-03 | Updated `.gitignore` with generated dataset artifacts | Repo hygiene for iterative data preprocessing outputs. |
| `027f896f` | 2025-10-03 | Simplified `.gitignore` to ignore `data/` | Practical cleanup to reduce accidental large-data tracking churn. |
| `5febcbfb` | 2025-10-03 | Edited `examples/train_lora/llama3_lora_sft.yaml` (`lora_rank`, `lora_alpha`) | Hyperparameter adjustment for LoRA baseline iteration. |

## Notes for reviewers
- Commit messages are minimal (`update/uodate`), so interpretation relies on file-level diff evidence.
- The largest commit contains mixed artifact types (data, configs, logs, infra), consistent with exploratory research workflows.
- Because the project was later refactored, this map should be read as **branch-local contribution evidence**, not final-paper code ownership.
