<!--
version: 1.1.0
-->

# Codex-Legal-CN-Judgment-Predictor

> 中国法裁判预测框架 — 纯 Prompt 驱动 · 三角色对抗辩论 · 零模型训练

输入案件事实，输出结构化判决预测报告。通过模拟原告主张、被告抗辩、法官裁决的对抗过程，生成可溯源、可评估的判决预测。

## 快速开始

```powershell
git clone https://github.com/laubeing-droid/codex-claude-legal-cn-judgment-predictor.git
cd codex-claude-legal-cn-judgment-predictor
.\install.ps1
```

安装脚本自动拉取必需依赖（core-codices + mcp-hub）。

### 使用
```
@judgment-predictor [案件事实描述]
```

## 工作流

```
案件事实输入 → 要件抽取 → 原告主张 → 被告抗辩 → 法官综合裁决 → 预测报告 → 自评
```

核心设计：
- **对抗求真**：三角色多轮辩论逼近真实裁判
- **纯 Prompt 驱动**：零模型训练/微调，易于迭代
- **深度联动**：对接 core-codices 法条要件 + mcp-hub 类案检索
- **结构输出**：从要素到预测到自评，全链路标准化

## 安装链路

运行 `install.ps1` 自动安装：
- **[必需]** `codex-claude-legal-cn-core-codices` — 162部法律全文JSON
- **[必需]** `codex-claude-legal-cn-mcp-hub` — MCP 连接器（Quick 模式）

## 配套项目

| 仓库 | 说明 |
|------|------|
| [core-codices](https://github.com/laubeing-droid/codex-claude-legal-cn-core-codices) | 法律数据库 — 162 部法律全文 JSON |
| [codex-claude-legal-cn-main](https://github.com/laubeing-droid/codex-claude-legal-cn-main) | 法律技能集 — 150+ 子技能 |
| [mcp-hub](https://github.com/laubeing-droid/codex-claude-legal-cn-mcp-hub) | MCP 连接器中心 — 类案检索 |
| [alignment-framework](https://github.com/laubeing-droid/PRC-US-Legal-Semantic-Alignment-Framework) | 中美法律语义对齐 — 阻断美式概念污染判决推理 |

## 许可

MIT
