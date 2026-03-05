# Experiment Run Snapshots (Branch-Local)

The following values are extracted from local log files kept in this fork. These are useful for portfolio discussion and should not be presented as final paper numbers.

| Run ID | Log file | Dataset load line | Output dir hint | Final train loss | Final eval loss | Train runtime |
|---|---|---|---|---:|---:|---|
| R1 | `CGM_baseline/logs/ltrain_log` | `Loading dataset CGM_merge_query_train_set.json...` | `saves_tool/Qwen2.5-7B-merge` | 0.1533 | 0.0605 | 10:13:53 |
| R2 | `CGM_baseline/logs/trainQwen.out` | `Loading dataset dialogue_train_merge.json...` | `saves_tool/Qwen3-8B-merge` | 0.3902 | 0.2737 | 15:19:30 |
| R3 | `CGM_baseline/logs/train.out` | `Loading dataset apigen_train_merge.json...` | `saves_tool/Qwen3-8B-merge` | 0.2215 | 0.0827 | 10:32:05 |

## Interpretation (conservative)
- These runs demonstrate that I executed end-to-end SFT baselines and tracked convergence on multiple dataset mixtures.
- R2 -> R3 suggests iterative dataset/config refinement correlated with improved eval loss in this branch.
- Logs include practical data-quality warnings and multi-GPU training traces, which is typical in early-stage agent tuning.

## Re-extract evidence
Use:

```bash
bash portfolio/scripts/collect_evidence.sh
```

This regenerates quick text snapshots under `portfolio/evidence/generated/`.
