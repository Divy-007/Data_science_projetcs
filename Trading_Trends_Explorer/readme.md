# 📈 Trading Trends Explorer

This project started with a simple question in my head:

> “Everyone talks about moving averages and volatility… but what does it actually look like when the market goes crazy?”

So instead of watching another finance video, I opened Jupyter Notebook and started pulling real market data.

This project is me trying to understand the stock market through code.

---

## 💭 Why I Built This

I didn’t build this to predict the next multibagger stock.

I built this to:

- Understand how trends actually form over time  
- See how risk spikes during corrections  
- Compare “stable” companies and test if they’re really stable  
- Practice real-world data handling instead of toy datasets  

I recently got interested in financial data and wanted to apply Python in a practical way — not just solve textbook problems.

---

## 🏢 Stocks Analyzed

- **TCS**
- **Infosys**
- **Reliance Industries**

These are large, established Indian companies across different sectors.  
If even these companies show strong volatility during corrections, it says something important about overall market risk.

---

## ⚙️ What I Did

### 🗂️ Step 1: Data Collection

- Pulled historical data (2020–Present) using `yFinance`
- Handled missing values using forward-fill

**Lesson learned:** Real financial data is messy. Always.

---

### 📈 Step 2: Feature Engineering

Implemented:

- **MA20** → 20-Day Moving Average (short-term trend)
- **MA90** → 90-Day Moving Average (long-term trend)
- **Daily Returns** → Percentage change in closing price
- **90-Day Rolling Volatility** → Risk measurement using rolling standard deviation

When I plotted MA20 and MA90 together, trend direction became much clearer compared to raw price charts.

---

### 📊 Step 3: Trend Analysis

Analyzed:

- Closing price movements across stocks
- Moving average crossovers
- Periods of clear trend shifts

**Key realization:**  
Moving average crossovers look convincing in hindsight.  
But they are lagging indicators — not predictive magic.

---

### ⚠️ Step 4: Risk Analysis

- Visualized volatility spikes
- Analyzed daily return distributions
- Identified high-risk correction periods

Seeing volatility spike during market corrections was eye-opening.  
It’s different when you *see* the standard deviation explode on a graph.

---

## 🧠 What This Project Taught Me

- Data cleaning matters more than theory.
- Rolling window calculations are powerful.
- Visual intuition builds stronger understanding than memorizing formulas.
- Large companies are not immune to volatility.
- Technical indicators are tools — not crystal balls.

I understand market behavior better now — not because I read more, but because I plotted more.

---

## 🛠️ Tech Stack

- Python  
- Pandas  
- NumPy  
- Matplotlib  
- yFinance  
- Jupyter Notebook  
- Git & GitHub  

---

## 📂 Project Structure
