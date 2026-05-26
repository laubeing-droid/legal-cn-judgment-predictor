<!--
version: 1.0.1
module: docs
status: active
-->

# 快速入门 — legal-cn-judgment-predictor

## 安装

本仓库为纯 Prompt 技能，无需编译安装。在 Codex Desktop 中加载即可使用。

```bash
git clone https://github.com/laubeing-droid/legal-cn-judgment-predictor.git
```

将 `SKILL.md` 所在目录导入 Codex Desktop 技能库。

## 使用

在 Codex Desktop 中输入案件事实，裁判预测框架自动触发三角色对抗辩论：

```
原告主张：XXX公司拖欠货款50万元
被告抗辩：货物质量不合格
```

系统依次运行：原告代理 → 被告代理 → 法官综合裁决 → 输出结构化判决预测报告。

## 报告内容

- 适用法条及依据
- 胜败方向预测 + 置信度
- 金额/刑期区间估算
- 完整推理链
- 自评与局限说明

## 联动

- 法条核验：通过 [MCP Hub](https://github.com/laubeing-droid/legal-cn-mcp-hub) 调用北大法宝/元典智库
- 概念对齐：通过 [ALN Framework](https://github.com/laubeing-droid/PRC-US-Legal-Semantic-Alignment-Framework) 过滤美国法概念
