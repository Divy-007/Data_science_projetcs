🛒 Olist E-Commerce Profitability & Incentive Audit

(SQL-first analytics + ML-supported decision system)

An industry-ready data analytics project built on the Brazilian Olist E-commerce dataset, focused on profitability leakage, incentive failure, and loss-making customer behavior.

This project is intentionally SQL-first and business-driven.
Machine Learning is used only where it adds decision value, not as a buzzword.

🎯 Business Problem

Most e-commerce companies optimize for revenue and order volume, not profit.

This creates silent failure modes:

High-revenue customers who consistently destroy margin

Logistics (freight) costs eroding profitability

Incentive systems that reward unprofitable behavior

Core question:

Are incentives and logistics policies rewarding the wrong customers — and how much does it cost the business?

🧠 Executive Summary (Key Findings)

Revenue growth can hide systematic losses

A minority of customers contributes a disproportionate share of total losses

Loss-making behavior is repeated, not random

Freight cost is a major, often ignored driver of unprofitability

Incentives tied to revenue and order frequency reinforce bad economics

Conclusion:
Blanket incentive policies are inefficient. Targeted, profitability-aware decisions are required.

🏗️ Architecture & Workflow
Phase 1 — Data Engineering (SQL-First)

PostgreSQL used as the single source of truth

Proper schema design with primary and foreign keys

All CSVs loaded using COPY (no Pandas shortcuts)

Manual validation of critical relationships

Customer identity handled correctly using customer_unique_id

Phase 2 — SQL Analytics Engineering

Business metrics are built layer-by-layer using SQL views, not one-off queries.

Core analytical layers:

Order Revenue

Estimated Cost (60% of revenue assumption)

Freight / Logistics Cost

Order-level Net Profit

Customer-level Profitability

Loss-making Customer Identification

Each metric is defined once and reused, ensuring consistency and auditability.

Phase 3 — Business Storytelling & Damage Quantification

SQL outputs are translated into manager-level insights:

Revenue vs Profit illusion

Repeat loss-making behavior

Concentration of damage

Incentive failure patterns

Key result:

The system is training customers to be unprofitable — and then rewarding them.

Phase 4 — Customer Segmentation (Rule-Based)

Customers are segmented using explainable, business-aligned rules:

Profitable — sustainable profit, low cost pressure

Borderline — near break-even or high freight risk

Loss-making — negative profit or repeated loss behavior

This segmentation is designed for decision-making, not clustering aesthetics.

Phase 5 — Machine Learning (Supporting Role)
ML Objective

Predict whether a customer is loss-making, to support incentive decisions.

Model

Logistic Regression (baseline)

Features

Freight ratio

Average order value

Order intensity

Total order count

Key Result

Even after removing outcome-derived features, the model achieves very high performance using behavioral and logistics pressure signals.

Important Limitation (Explicit)

Features summarize full customer history, making the model a retrospective risk classifier, not a real-time predictor.

ML is used here to validate patterns and standardize risk scoring, not to claim future omniscience.

This limitation is documented intentionally.

Phase 6 — Deployment (Decision Support)

A lightweight Streamlit dashboard is used to present:

Customer segment

Key profitability drivers

ML risk score

Incentive recommendation

The system does not automate decisions.
It standardizes and supports them.

🧮 Metrics & Assumptions
Core Metrics

Revenue per order

Revenue per customer

Estimated cost per order

Freight cost

Net profit (order & customer level)

Freight ratio (freight / revenue)

Cost Assumption

Actual product cost is not available in the dataset.
A conservative 60% revenue-based cost assumption is applied consistently and explicitly documented.

🚨 Loss-Making Customer Definition (Data-Honest)

A customer is classified as loss-making if multiple economic signals indicate unviability:

❌ Negative lifetime net profit

🚚 High freight-to-revenue ratio

⭐ Repeated low reviews (average ≤ 2, with sufficient orders)

🔁 Repeated loss-making orders

No assumptions about fraud or returns beyond what the data supports.

📁 Project Structure
├── sql/
│   ├── schema.sql
│   ├── load_data.sql
│   ├── order_profit.sql
│   ├── customer_profit.sql
│   └── bad_customers.sql
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
├── requirements.txt
└── README.md

🧰 Tech Stack

PostgreSQL — analytics warehouse

SQL (Views, Joins, Aggregations) — business logic

Python (Pandas, Scikit-learn) — analysis & ML

Streamlit — decision-support deployment

Git/GitHub — versioned analytics workflow

💡 Business Recommendations

Stop tying incentives purely to revenue or order volume

Introduce profitability-aware incentive rules

Restrict free shipping and discounts for high-risk customers

Monitor borderline customers instead of rewarding blindly

🔮 Future Improvements

Time-aware features for early prediction

Return and refund data integration

Policy simulation to estimate profit uplift

👤 Author

Devu
Engineering Student | Data Analytics & Business Intelligence


