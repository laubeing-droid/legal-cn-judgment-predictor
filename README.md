<!--
version: 1.0.2
module: judgment-predictor
status: active
-->

# Codex-Legal-CN-Judgment-Predictor ???

> **中国法裁判预测框架** — 输入案件事实，输出结构化判决预测报告

纯 Prompt 驱动，零模型训练。基于三角色对抗辩论（原告 / 被告 → 法官综合裁决），深度联动 [codex-claude-legal-cn-core-codices](https://github.com/laubeing-droid/codex-claude-legal-cn-core-codices)（162部法条全文JSON）和 MCP 工具，为法律从业者提供可溯源、可评估的判决预测能力。

---

## 项目简介

**Codex-Legal-CN-Judgment-Predictor** 是一个面向中国法律实务场景的智能判决预测工具。它不走传统 ML 训练路线，而是以**大语言模型 Prompt 编排**为核心，通过模拟真实庭审中原告主张、被告抗辩、法官裁决的对抗过程，生成结构化的判决预测报告。

核心设计理念：

- **对抗求真**：让 AI 分别扮演原告方、被告方、法官三个角色，通过多轮辩论碰撞出更接近真实裁判的预测结果
- **纯 Prompt 驱动**：所有逻辑通过提示词模板编排，零模型训练/微调，易于维护和迭代
- **深度联动**：对接 [core-codices](https://github.com/laubeing-droid/codex-claude-legal-cn-core-codices) 法律知识库（162部法条）和 MCP 工具（类案检索、法条核验），确保预测有据可依
- **结构化输出**：从案件要素抽取到判决预测再到自评报告，全链路标准化
