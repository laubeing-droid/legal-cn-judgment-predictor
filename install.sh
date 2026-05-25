#!/bin/bash
# Codex-Legal-CN-Judgment-Predictor install script
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"
SKILLS_DIR="$HOME/.codex/skills"

echo "=== Codex-Legal-CN-Judgment-Predictor v1.1.0 ==="
echo ""

# Required: core-codices
CODICES_DIR="$PARENT_DIR/codex-claude-legal-cn-core-codices"
if [ -d "$CODICES_DIR" ]; then
    echo "[OK] core-codices exists: $CODICES_DIR"
else
    echo "[INSTALL] core-codices -> $CODICES_DIR"
    git clone --depth 1 https://github.com/laubeing-droid/codex-claude-legal-cn-core-codices.git "$CODICES_DIR"
fi

# Required: mcp-hub
MCP_DIR="$PARENT_DIR/codex-claude-legal-cn-mcp-hub"
if [ -d "$MCP_DIR" ]; then
    echo "[OK] mcp-hub exists: $MCP_DIR"
else
    echo "[INSTALL] mcp-hub -> $MCP_DIR"
    git clone --depth 1 https://github.com/laubeing-droid/codex-claude-legal-cn-mcp-hub.git "$MCP_DIR"
fi

# Install skill
mkdir -p "$SKILLS_DIR/judgment-predictor"
cp "$SCRIPT_DIR/SKILL.md" "$SKILLS_DIR/judgment-predictor/SKILL.md"
echo "[OK] Skill installed: $SKILLS_DIR/judgment-predictor"
echo ""
echo "Done. Restart Codex Desktop / Claude Code."
