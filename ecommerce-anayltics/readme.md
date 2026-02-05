# 🛒 Olist E-Commerce Profitability & Incentive Audit

*(SQL-first analytics + ML-supported decision system)*

An **industry-ready data analytics project** built on the Brazilian **Olist E-commerce dataset**, focused on **profitability leakage, incentive failure, and loss-making customer behavior**.

This project is intentionally **SQL-first** and **business-driven**.  
Machine Learning is used **only where it adds decision value**, not as a buzzword.

---

## 🎯 Business Problem

Most e-commerce companies optimize for **revenue and order volume**, not **profit**.

This creates silent failure modes:

- High-revenue customers who consistently destroy margin  
- Logistics (freight) costs eroding profitability  
- Incentive systems that reward unprofitable behavior  

**Core question:**

> Are incentives and logistics policies rewarding the wrong customers — and how much does it cost the business?

---

## 🧠 Executive Summary

- Revenue growth can **hide systematic losses**
- A **minority of customers** contributes a **disproportionate share of total losses**
- Loss-making behavior is **repeated**, not random
- Freight cost is a major hidden driver of unprofitability

**Conclusion:**  
Blanket incentive policies are inefficient. **Targeted, profitability-aware decisions are required.**

---

## 🏗️ Architecture & Workflow

### Phase 1 — Data Engineering (SQL-First)

- PostgreSQL as the **single source of truth**
- Proper schema design with PKs & FKs
- CSV ingestion via `COPY`
- Correct customer identity using `customer_unique_id`

---

### Phase 2 — SQL Analytics Engineering

Business metrics built **layer-by-layer using SQL views**:

1. Order Revenue  
2. Estimated Cost (60% assumption)  
3. Freight / Logistics Cost  
4. Order-level Net Profit  
5. Customer-level Profitability  
6. Loss-making Customer Identification  

Metrics are defined once and reused — no duplicated logic.

---

### Phase 3 — Business Storytelling & Damage Quantification

- Revenue vs Profit illusion  
- Repeated loss-making behavior  
- Concentration of damage  
- Incentive failure patterns  

> *The system is training customers to be unprofitable — and then rewarding them.*

---

### Phase 4 — Customer Segmentation

Rule-based, explainable segmentation:

- **Profitable** — sustainable profit  
- **Borderline** — high freight risk / near break-even  
- **Loss-making** — negative profit or repeated losses  

Built for **business action**, not clustering aesthetics.

---

### Phase 5 — Machine Learning (Supporting Role)

#### Objective
Predict whether a customer is **loss-making**, to support incentive decisions.

#### Model
- Logistic Regression (baseline)

#### Features
- Freight ratio  
- Average order value  
- Order intensity  
- Total order count  

#### Important Limitation
Features summarize **full customer history**, so the model acts as a  
**retrospective risk classifier**, not a real-time predictor.

ML is used to **validate patterns and standardize risk scoring**.

---

### Phase 6 — Deployment (Decision Support)

A lightweight **Streamlit dashboard** shows:

- Customer segment  
- Key profitability drivers  
- ML risk score  
- Incentive recommendation  

Decisions are **supported**, not automated.

---

## 🧮 Metrics & Assumptions

### Core Metrics

- Revenue per order  
- Revenue per customer  
- Estimated cost per order  
- Freight cost  
- Net profit  
- Freight ratio  

### Cost Assumption

Actual product cost is unavailable.  
A **60% revenue-based cost proxy** is applied consistently.

---

## 🚨 Loss-Making Customer Definition

A customer is classified as **loss-making** if multiple signals indicate risk:

- Negative lifetime net profit  
- High freight-to-revenue ratio  
- Repeated low reviews  
- Repeated loss-making orders  

No assumptions beyond what the data supports.

---

## 📁 Project Structure
''' text
├── sql/
│   ├── schema.sql
│   ├── load_data.sql
│   ├── order_profit.sql
│   ├── customer_profit.sql
│   ├── bad_customers.sql
│   └── order_customer_profit.sql
│
├── notebooks/
│   ├── 02_business_storytelling.ipynb
│   ├── 03_damage_quantification.ipynb
│   ├── 04_segmentation.ipynb
│   └── 05_ml_risk_model.ipynb
│
├── app/
│   └── streamlit_app.py
│
├── reports/
│
├── requirements.txt
└── README.md

'''
---

## 🧰 Tech Stack

- PostgreSQL  
- SQL (Views, Joins, Aggregations)  
- Python (Pandas, Scikit-learn)  
- Streamlit  
- Git / GitHub  

---

## 💡 Business Recommendations

- Stop incentives based only on revenue  
- Introduce profitability-aware rules  
- Restrict free shipping for high-risk customers  
- Monitor borderline customers carefully  

---

## 🔮 Future Improvements

- Time-aware features  
- Return / refund data  
- Policy simulation  

---

## 👤 Author

**Devu**  
Engineering Student | Data Analytics & Business Intelligence  

> This project prioritizes **business correctness and transparency** over flashy models.
