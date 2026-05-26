# legal-cn-judgment-predictor

> 中国法裁判预测框架 · Codex Desktop / Claude Code / WorkBuddy / Trae 四平台通用

纯 Prompt 驱动，多角色对抗辩论，零模型训练。输入案件事实，输出结构化判决预测报告。

## 工作流

```
案件事实输入 → 要素抽取 → 原告主张 → 被告抗辩 → 法官综合裁决 → 预测报告 → 自评
```

## 平台支持

| 平台 | 安装方式 |
|:-----|:-----|
| **Codex Desktop** | `@judgment-predictor [案件事实]` |
| **Claude Code** | `/legal-cn-judgment-predictor [案件事实]` |
| **WorkBuddy** | ZIP 导入后对话触发 |
| **Trae** | 技能加载后对话触发 |

## 快速开始

```powershell
git clone https://github.com/laubeing-droid/legal-cn-judgment-predictor.git
cd legal-cn-judgment-predictor
.\install.ps1
```

## 生态项目

| 仓库 | 说明 |
|:-----|:-----|
| [legal-cn-main](https://github.com/laubeing-droid/legal-cn-main) | 法律技能主仓库 |
| [legal-cn-core-codices](https://github.com/laubeing-droid/legal-cn-core-codices) | 法律数据库（法条要件输入源） |
| [legal-cn-mcp-hub](https://github.com/laubeing-droid/legal-cn-mcp-hub) | MCP 连接器（类案检索） |

## 开发准则

参见 [AGENTS.md](AGENTS.md)
