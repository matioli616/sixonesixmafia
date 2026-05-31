#!/usr/bin/env bash
set -e
echo "🔧  Instalando Claude Code (Node $(node -v))..."
npm install -g @anthropic-ai/claude-code
echo ""
echo "✅  Claude Code instalado:"
claude --version || true
echo ""
echo "▶  Para começar: rode  claude  no terminal."
echo "   Auth: secret ANTHROPIC_API_KEY (API) ou faça login com sua conta (Pro/Max)."
echo "   Diagnóstico:  claude doctor"
