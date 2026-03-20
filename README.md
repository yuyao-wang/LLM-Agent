# LLM Agent System (Portfolio Snapshot)

> This repository is a **shareable portfolio snapshot** of my early-stage work on an LLM agent system.

## My Contributions

- Designed and implemented an early-stage LLM agent pipeline
- Built multi-turn tool-calling data format (structured reasoning + tool use)
- Implemented and tuned LoRA/SFT training for LLM fine-tuning
- Ran baseline experiments and collected training logs/metrics
- Built this standalone repo to demonstrate my work

**Authorship note:** I am a co-author (third author, non-lead). The final system was later developed by the full team.

## Project Snapshot
- Focus: temporal and multi-turn tool-calling over heterogeneous health-related signals (CGM + event streams).
- What I built: early data/training/evaluation workflow and baseline fine-tuning runs.
- Context: the related paper is under review; this repo is curated as my engineering portfolio branch.

## Start Here (5-minute review)
- Contribution map: [portfolio/evidence/commit_map.md](portfolio/evidence/commit_map.md)
- Run results snapshot: [portfolio/evidence/experiment_runs.md](portfolio/evidence/experiment_runs.md)
- Reusable training artifacts: [portfolio/artifacts/README.md](portfolio/artifacts/README.md)
- Resume-ready bullets: [portfolio/notes/resume_bullets.md](portfolio/notes/resume_bullets.md)

## Agent Engineering Work

### 1) Multi-turn Tool-Calling Data Pipeline
- Built and organized training mixtures for temporal/event-centric agent supervision.
- Designed data in a ShareGPT-style multi-turn tool-calling format and wired the `CGM_agent` schema.
- Structured samples around tool/API usage patterns (function call, observation, follow-up reasoning).
- Preserved interview-safe samples in `portfolio/artifacts/samples/`.

Representative dataset scales in this branch:
- `CGM_event_query_train_set.json`: 3,912 samples
- `CGM_time_query_train_set.json`: 5,053 samples
- `CGM_merge_query_train_set.json`: 8,965 samples
- `dialogue_train_merge.json`: 14,749 samples

### 2) Agent Model Adaptation (7B-8B)
- Implemented reusable LoRA/SFT configs for Qwen/Llama variants.
- Tuned core hyperparameters for fast agent baseline iteration (`lora_rank`, `lora_alpha`, lr, accumulation, scheduler).
- Saved config variants in `portfolio/artifacts/configs/` for reproducible re-runs.

### 3) Agent Training Runs + Evaluation Tracking
- Ran distributed training jobs and retained logs/metrics for comparison.
- Tracked train/eval progression across dataset mixtures for tool-calling robustness.

Run snapshots:
- R1 (`Qwen2.5-7B`): train loss `0.1533`, eval loss `0.0605`
- R2 (`Qwen3-8B`, mixture A): train loss `0.3902`, eval loss `0.2737`
- R3 (`Qwen3-8B`, mixture B): train loss `0.2215`, eval loss `0.0827`

## Repo Map
- `llama-factory/`: base code workspace (forked framework side)
- `CGM_baseline/logs/`: raw baseline training logs
- `portfolio/artifacts/configs/`: training and merge configs
- `portfolio/artifacts/samples/`: compact dataset examples
- `portfolio/evidence/`: commit mapping, run snapshots, generated evidence exports
- `portfolio/scripts/collect_evidence.sh`: regenerate evidence files from git/logs

## Quick Command
```bash
bash portfolio/scripts/collect_evidence.sh
```
