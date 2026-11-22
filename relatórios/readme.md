# Relatório de Diagnóstico de Fraude e Plano de Ação

Relatório descritivo estruturado a partir da apresentação executiva **Diagnóstico de Fraude e Plano de Ação**, mapeando a exposição financeira atual, o comportamento do motor de fraude, os gargalos por categoria, geografia e canal de venda, além das recomendações prioritárias.

---

## 1. Cenário Atual da Fraude

Esta etapa apresenta a visão geral do impacto financeiro da fraude sobre o volume transacionado da companhia, estabelecendo a linha de base de perda direta e taxa média atual.

* **Valor total transacionado:** R$ 6.535.889,21 (exposição atual de R$ 6,54 milhões)
* **Perda direta em fraudes:** R$ 547.528,21 (cerca de R$ 547,5 mil)
* **Taxa atual de fraude da companhia:** 5%

**Gráfico:** [[`[Percentual de Fraude]`](https://github.com/JATMF94/case_fraude_unipds/blob/05ff39c3316a5a68aa71fd2eeae306ae5e717ce1/assets/Gerac%CC%A7a%CC%83o%20de%20relato%CC%81rios%20do%20Data%20Studio%20-%2021_11_2026%2C%2016_23_Departamento_Medidor.png)

---

## 2. Evolução do Modelo de Fraude

Esta seção avalia o desempenho das versões do modelo comportamental ao longo das atualizações, destacando a piora observada na transição para a versão mais recente.

* **Comparativo entre versões:**
  * `cb_v1`: 4,98% de taxa de fraude (741 fraudes)
  * `cb_v2`: 4,96% de taxa de fraude (2.240 fraudes)
  * `cb_v2.3`: 5,02% de taxa de fraude (4.529 fraudes)
* **Diagnóstico:** Houve piora na transição de `cb_v2` para `cb_v2.3`, com aumento na taxa de fraude e no volume de ocorrências — indicando possíveis *gaps* de regras ou impacto do aumento de transações, em contraste com a queda anterior de taxa mesmo com crescimento de volume.

**Gráfico:** [`[EVOLUÇÃO DO MODELO]`](https://github.com/JATMF94/case_fraude_unipds/blob/17847997dcbe85789518969aa730d7a0d0c91fa4/assets/Gerac%CC%A7a%CC%83o%20de%20relato%CC%81rios%20do%20Data%20Studio%20-%2021_11_2026%2C%2016_23_Pa%CC%81gina%20sem%20ti%CC%81tulo_Gra%CC%81fico%20de%20linhas-2.png)

---

## 3. Concentração por Categoria

Esta etapa examina como as perdas por fraude e o ticket médio se distribuem entre as categorias de produtos, evidenciando o principal foco de atenção.

* **Categoria líder:** **Automotivo** concentra o maior prejuízo acumulado, com **R$ 153,1 mil** perdidos e taxa acima da média de 5% da companhia.
* **Ticket médio da fraude em automotivo:** **R$ 65,90**, valor que orienta a necessidade de reforçar regras de prevenção para compras nesse patamar de ticket.

**Gráfico:** [`[CONCENTRAÇÃO POR CATEGORIA]`](https://github.com/JATMF94/case_fraude_unipds/blob/17847997dcbe85789518969aa730d7a0d0c91fa4/assets/Gerac%CC%A7a%CC%83o%20de%20relato%CC%81rios%20do%20Data%20Studio%20-%2021_11_2026%2C%2016_23_Gra%CC%81fico%20de%20linhas-2.png)

---

## 4. Geografia da Fraude e Foco Crítico no Brasil

Esta seção detalha o comportamento da fraude por mercado de atuação, com foco no Brasil e no cruzamento com a categoria automotiva.

* **Panorama por país:**
  * **Brasil:** R$ 424.955,83 em valor perdido, preço médio de R$ 68,89 e taxa de fraude de **5,52%** (maior prejuízo e taxa acima da média da companhia, impulsionados pelo maior volume transacional e maior exposição a fraudadores).
  * **Argentina:** R$ 110.273,72 em valor perdido, preço médio de R$ 93,37 e taxa de fraude de **3,69%**.
  * **Estados Unidos:** R$ 6.775,67 em valor perdido, preço médio de R$ 96,80 e taxa de fraude de **3,07%**.
* **Foco crítico — Automotivo no Brasil:** A categoria apresenta **6,79%** de taxa de fraude e **R$ 121.277** perdidos no mercado brasileiro, superando a média de 5% da companhia e ficando acima das demais categorias locais (que variam entre 5,37% e 5,65%).

**Gráfico (Geografia da Fraude):** [`[GEOGRAFIA DA FRAUDE]`](https://github.com/JATMF94/case_fraude_unipds/blob/61d85666c8ed8548cbcb3e7ca24bec679370cf01/assets/Gerac%CC%A7a%CC%83o%20de%20relato%CC%81rios%20do%20Data%20Studio%20-%2021_11_2026%2C%2016_23_Pa%CC%81gina%20sem%20ti%CC%81tulo_Tabela-2.png)

**Gráfico (Foco Crítico — Brasil / Automotivo):**  [[`[Fraude no Mercado Brasileiro]`](https://github.com/JATMF94/case_fraude_unipds/blob/8db7c18ad71171e2a2f657e3ac312aaf6ace3b5d/assets/Gerac%CC%A7a%CC%83o%20de%20relato%CC%81rios%20do%20Data%20Studio%20-%2021_11_2026%2C%2016_23_Gra%CC%81fico%20de%20linhas-2.png)

---

## 5. Canal de Venda

Esta etapa analisa a distribuição da taxa de fraude entre os canais de aquisição/venda e parceiros, identificando o principal vetor de risco.

* **Taxas por canal de venda:**
  * `api_parceiro`: **5,12%** (principal vetor de risco externo)
  * `app_android`: **5,03%** (levemente acima da média)
  * `web_desktop`: **5,00%**
  * `web_mobile`: **4,96%**
  * `app_ios`: **4,89%**
* **Ponto de atenção:** Apesar da proximidade entre os canais, o canal de parceiros puxa a taxa e exige investigação aprofundada do perfil dos fraudadores e diligência quanto a possível envolvimento/conluio operacional.

**Gráfico:** [`[CANAL DE VENDA]`](https://github.com/JATMF94/case_fraude_unipds/blob/17847997dcbe85789518969aa730d7a0d0c91fa4/assets/Gerac%CC%A7a%CC%83o%20de%20relato%CC%81rios%20do%20Data%20Studio%20-%2021_11_2026%2C%2016_23_Pa%CC%81gina%20sem%20ti%CC%81tulo_Gra%CC%81fico%20de%20barras.png)

---

## 6. Calibração de Score de Fraude

Esta seção avalia a eficácia da pontuação de risco (`score_fraude_modelo`) na separação entre transações legítimas e fraudulentas.

* **Faixas 1 a 3 (Baixo Risco):** Concentram entre **2,8% e 4,7%** de fraudes na distribuição do score (ex.: 2,78% na faixa 1, 4,68% na faixa 2 e 3,23% na faixa 3), evidenciando aprovação indevida de transações fraudulentas com score baixo.
* **Faixas 4 a 9 (Zona Cinzenta / Incerteza):** A incidência de fraude varia de forma gradual (0,31% na faixa 4, 0,57% na 5, 1,32% na 6, 1,96% na 7, 5,25% na 8 e 8,50% na 9), com incerteza mais evidente entre as faixas intermediárias (4 a 7) e sem um corte claro de decisão.
* **Faixa 10:** Concentra a maior proporção de fraude (**21,41%** / 21,4%), deixando as faixas intermediárias mal delimitadas.

**Gráfico:** [`[CALIBRAÇÃO DE SCORE]`](https://github.com/JATMF94/case_fraude_unipds/blob/17847997dcbe85789518969aa730d7a0d0c91fa4/assets/Gerac%CC%A7a%CC%83o%20de%20relato%CC%81rios%20do%20Data%20Studio%20-%2021_11_2026%2C%2016_23_Departamento_Tabela-2.png)

---

## 7. Plano de Ação e Recomendações Prioritárias

Com base nos achados anteriores, a apresentação define frentes prioritárias de atuação conjunta entre Risco, Produto e Parcerias:

* **Auditar API de Parceiros:** Investigar a origem das fraudes nos canais de parceiros, detalhar o comportamento dos fraudadores e realizar diligência para descartar ou confirmar conluio/envolvimento operacional.
* **Aplicar fricção no mercado brasileiro:** Exigir autenticação adicional em compras da categoria automotiva acima do ticket médio de referência (**R$ 65,90**).
* **Recalibrar o modelo e as regras:** Revisar as regras introduzidas na versão `cb_v2.3` e ajustar os pontos de corte nas faixas intermediárias de score.
* **Próximos passos:** Alinhar cronograma e responsabilidades com os times de **Risco**, **Produto** e **Parcerias** para execução imediata.

