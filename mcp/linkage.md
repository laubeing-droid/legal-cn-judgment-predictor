# MCP Hub 联动

## 联动架构

```
Codex-Legal-CN-Judgment-Predictor
    ├── 知识注入 ← Claude-for-Legal-CN
    │   ├── law-semantic-tree.json    (法条→要件→效果)
    │   ├── blocking-list.md          (29 阻断概念)
    │   └── reasoning-template-zh.md  (中国法推理链)
    │
    └── 工具调用 ← Codex-Claude-legal-cn-mcp-hub
        ├── 案例库 MCP      → 类案检索
        ├── 国家法规库 MCP  → 法条核验
        └── 元典智库 MCP    → 综合法律检索
```

## 联动时机

| 阶段 | MCP 调用 | 目的 |
|:-----|:---------|:-----|
| 事实抽取后 | 案例库：按案由+关键词搜索类案 | 获取类案裁判倾向 |
| 法律适用辩论 | 国家法规库：核验法条现行有效性 | 确认法条未被修订/废止 |
| 对抗辩论中 | 案例库：分别以原告/被告关键词搜索 | 双方各取有利类案 |
| 法官裁决前 | 元典智库：综合检索裁判规则 | 确认主流裁判观点 |
| 自评阶段 | 案例库：对比预测结果与类案实际判决 | 计算类案偏离度 |

## 调用方式

### 案例库 MCP
```
search_similar_cases(query="[案由+关键事实]", limit=5)
```

### 国家法规库 MCP
```
verify_law(law_name="[法律名称]", article="[条号]")
```

### 元典智库 MCP
```
comprehensive_search(topic="[法律问题]", scope="[法规/案例/观点]")
```

## 无 MCP 降级策略
当 MCP Hub 未安装或不可用时：
- 基于 Claude-for-Legal-CN 知识库中的法条文本工作
- 在报告中标注 `[需通过MCP核验法条现行有效性]`
- 类案引用标注 `[需通过MCP检索确认]`