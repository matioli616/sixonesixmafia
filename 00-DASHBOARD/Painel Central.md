---
type: dashboard
tags: [dashboard]
---
# 🎛️ Painel Central — 616 Mafia Studio

> Requer o plugin **Dataview** ativo.

## 🔥 Em produção (WIP)
```dataview
TABLE status, tema, emocao, nota_geral AS "Nota"
FROM "07-LETRAS/WIP"
WHERE type = "musica"
SORT file.mtime DESC
```

## ✅ Finalizadas (Grammy-ready)
```dataview
TABLE tema, emocao, nota_geral AS "Nota", data
FROM "07-LETRAS/Finalizadas"
WHERE type = "musica"
SORT nota_geral DESC
```

## 💡 Conceitos no banco
```dataview
TABLE originalidade AS "Orig", profundidade AS "Prof", single AS "Single"
FROM "06-CONHECIMENTO/Conceitos"
WHERE type = "conceito"
SORT originalidade DESC
```

## 🎤 Top barras
```dataview
TABLE tema, emocao, qualidade AS "Q", intensidade AS "Int"
FROM "06-CONHECIMENTO/Barras"
WHERE type = "barra"
SORT qualidade DESC
LIMIT 10
```

## 🪝 Refrões por potencial viral
```dataview
TABLE viral AS "Viral", comercial AS "Comercial", nota AS "Nota"
FROM "06-CONHECIMENTO/Refrões"
WHERE type = "refrao"
SORT viral DESC
```

## Atalhos
[[Métricas & Pipeline]] · [[_Organograma]] · [[SOP Mestre - Pipeline]] ·
[[Identidade Artística]] · [[Léxico Proibido]]
