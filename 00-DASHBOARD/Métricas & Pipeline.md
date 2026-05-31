---
type: dashboard
tags: [dashboard, métricas]
---
# 📊 Métricas & Pipeline

## Avaliações recentes
```dataview
TABLE faixa, nota_geral AS "Nota", veredito, data
FROM "08-AVALIACOES"
WHERE type = "avaliacao"
SORT data DESC
```

## Funil (quantidades)
```dataview
TABLE length(rows) AS "Qtd"
FROM "06-CONHECIMENTO" OR "07-LETRAS"
WHERE type
GROUP BY type
```

## Linha de aprendizado
```dataview
LIST
FROM "09-APRENDIZADOS"
WHERE type = "aprendizado"
SORT data DESC
```

## Saúde do sistema
- Faixas finalizadas ≥85: alvo crescente mês a mês
- Clichês banidos: deve crescer (sinal de que o sistema aprende)
- Reuso de símbolos do universo: coerência de marca
