-- --Criar tabela
create or replace view unipds-fraude.fraude.analise as
Select
  tra.id_transacao,
  tra.data_compra,  
  tra.valor_compra,
  mode.fraude,
  tra.categoria_produto,
  tra.canal_venda,
  com.versao_modelo_comportamental,
  mode.score_fraude_modelo,
  tra.pais
from `fraude.transacoes`tra inner join `fraude.modelo`mode on tra.id_transacao = mode.id_transacao inner join `fraude.comportamentais` com on tra.id_transacao = com.id_transacao inner join`fraude.financeiros`fin on tra.id_transacao=fin.id_transacao 

--Cenário da Fraude
SELECT 
  -- Panorama total 
  count(*) as qtd_total_transacoes,
  ROUND (sum(valor_compra),2) as valor_total_compras,

  -- Panorama da fraude
  ROUND(sum(case when fraude =1 then ana.valor_compra else 0 end),2) as valor_fraude,
  sum (case when fraude =1 then fraude end ) as qtd_fraude,

  -- Percentual de quantidade de fraudes
  SAFE_DIVIDE(
    COUNT(CASE WHEN fraude = 1 THEN id_transacao END), 
    COUNT(id_transacao)
  )*100 AS percentual_qtd_fraude,
  
  -- Percentual de valor das fraudes 
  ROUND(
    SAFE_DIVIDE(
      SUM(CASE WHEN fraude = 1 THEN valor_compra END), 
      SUM(valor_compra)
    ), 2
  )*100 AS percentual_valor_fraude
FROM `fraude.analise` ana
----------------------------------------------------------- Concentração da Fraude por categoria

SELECT 
  cat.departamento,
  ROUND(sum(case when fraude =1 then ana.valor_compra else 0 end),2) as valor_fraude,
  ROUND(AVG(ana.fraude)*100,2) as pct_fraudes_departamentos,
  ROUND(AVG(case when fraude =1 then ana.valor_compra end),2) as preco_medio
From `fraude.analise` ana inner join  `unipds-fraude.fraude.categoria` cat on ana.categoria_produto = cat.id_categoria
GROUP BY cat.departamento
order by sum(ana.valor_compra) DESC

-- ------------------Concentração da Fraude por pais

SELECT 
  pa.nome_pais,
  ROUND(sum(case when fraude =1 then ana.valor_compra else 0 end),2) as valor_fraude,
  ROUND(AVG(case when fraude =1 then ana.valor_compra end),2) as preco_medio,
  ROUND(AVG(ana.fraude)*100,2) as pct_fraude_pais
From `fraude.analise` ana inner join `unipds-fraude.fraude.países` pa on ana.pais = pa.sigla_pais
GROUP BY pa.nome_pais
having COUNT (id_transacao) >500
order by sum(case when fraude =1 then ana.valor_compra else 0 end) DESC

SELECT 
  pa.nome_pais,
  cat.departamento,
  ROUND(sum(case when fraude =1 then ana.valor_compra else 0 end),2) as valor_fraude,
  ROUND(AVG(case when fraude =1 then ana.valor_compra end),2) as preco_medio,
  ROUND(AVG(ana.fraude)*100,2) as pct_fraude_pais
From `fraude.analise` ana inner join `unipds-fraude.fraude.países` pa on ana.pais = pa.sigla_pais inner join  `unipds-fraude.fraude.categoria` cat on ana.categoria_produto = cat.id_categoria
GROUP BY pa.nome_pais, cat.departamento
having COUNT (id_transacao) >500 
order by sum(case when fraude =1 then ana.valor_compra else 0 end) DESC

------------------------ Concentração da Fraude por canal

SELECT 
  ana.canal_venda,
  ROUND(AVG(ana.fraude)*100,2) as pct_fraude_canal,
  ROUND(sum(case when fraude =1 then ana.valor_compra else 0 end),2) as valor_fraude,
  ROUND(AVG(case when ana.fraude= 1 then ana.valor_compra end),2) as valor_medio_compra,
From `fraude.analise` ana 
GROUP BY ana.canal_venda
order by AVG(ana.fraude) DESC


------------------------Percentual de fraude por modelo

SELECT 
  ana.versao_modelo_comportamental,
  ROUND(sum(case when fraude=1 then ana.valor_compra else 0 end),2) as valor_fraude,
  SUM (ana.fraude) as qtd_fraude,
  ROUND(AVG(ana.fraude)*100,2) as pct_fraude_modelo
From `fraude.analise` ana 
GROUP BY ana.versao_modelo_comportamental
order by sum(ana.valor_compra) DESC

--------------------------------------- Identificar o score_fraude_modelo (refazer e quebrar por camada)

WITH faixas AS (
  SELECT 
    id_transacao,
    fraude,
    score_fraude_modelo,
    -- 1º Passo: Classifica cada compra em 1 das 4 faixas
    NTILE(10) OVER (ORDER BY score_fraude_modelo) AS faixa_score
  FROM `fraude.analise`
)
SELECT 
  faixa_score,
  Min(score_fraude_modelo),
  Max(score_fraude_modelo),
  -- Quantidade e % de vezes que esse score apareceu em FRAUDES
  ROUND(
    SAFE_DIVIDE(COUNTIF(fraude = 1), COUNT(*)) * 100, 
  2) AS pct_fraude_score,
  
  
  -- Quantidade e % de vezes que esse mesmo score apareceu em NÃO-FRAUDES
  ROUND(
    SAFE_DIVIDE(COUNTIF(fraude = 0), COUNT(*)) * 100, 
  2) AS pct_nao_fraude_score,
  
  -- Total de vezes que o modelo deu essa exata nota
  COUNT(*) AS total_ocorrencias

FROM faixas
group by faixa_score  
ORDER BY faixa_score
